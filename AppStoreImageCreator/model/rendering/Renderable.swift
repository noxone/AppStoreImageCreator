//
//  Renderable.swift
//  AppStoreImageCreator
//
//  Created by Olaf Neumann on 01.04.24.
//

import Foundation
import CoreGraphics
import CoreImage
import CoreImage.CIFilterBuiltins
#if os(macOS)
import AppKit
#else
import UIKit
#endif
import SwiftImageReadWrite // TODO: remove this

#if os(macOS)
typealias PlatformFont = NSFont
#else
typealias PlatformFont = UIFont
#endif

// MARK: Generic rendering

protocol Renderable {
    func render(into baseImage: CIImage, withExtent extent: CGRect) -> CIImage
}

fileprivate protocol ImageCreator : Renderable {
    var scale: CGSize { get }
    var rotationAngle: CGFloat { get }
    var position: CGPoint { get }
    func createImage(withExtent extent: CGRect) -> CIImage?
}

extension Renderable {
    fileprivate func render(_ imageToRender: CIImage, over baseImage: CIImage, scaling scale: CGSize, rotating rotationAngle: CGFloat, positionedAt position: CGPoint) -> CIImage {
        let imageToRenderExtent = imageToRender.extent
        let baseImageExtent = baseImage.extent
        
        return imageToRender
            .transformed(by: CGAffineTransform(translationX: imageToRenderExtent.width * -0.5, y: imageToRenderExtent.height * -0.5))
            .transformed(by: CGAffineTransform(scaleX: scale.width, y: scale.height))
            .transformed(by: CGAffineTransform(rotationAngle: rotationAngle / 180.0 * Double.pi))
            .transformed(by: CGAffineTransform(translationX: baseImageExtent.width * position.x, y: baseImageExtent.height * (1.0 - position.y)))
            .composited(over: baseImage)
    }
}

extension ImageCreator {
    var scale: CGSize { CGSize(width: 1.0, height: 1.0) }
    var rotationAngle: CGFloat { 0.0 }
    var position: CGPoint { CGPoint(x: 0, y: 0) }

    func render(into baseImage: CIImage, withExtent extent: CGRect) -> CIImage {
        guard let imageToRender = createImage(withExtent: extent) else {
            // TODO: log warning
            return baseImage
        }
        
        return render(imageToRender,
                      over: baseImage,
                      scaling: scale,
                      rotating: rotationAngle,
                      positionedAt: position)
    }
}

// MARK: Backgrounds

fileprivate protocol GeneratingBackground : ImageCreator {
}

extension GeneratingBackground {
    internal func render(into baseImage: CIImage, withExtent extent: CGRect) -> CIImage {
        return createImage(withExtent: extent) ?? baseImage
    }
}

extension BackgroundColor : GeneratingBackground {
    fileprivate func createImage(withExtent extent: CGRect) -> CIImage? {
        return CIImage(color: color.ciColor)
            .cropped(to: extent)
    }
}

extension SimpleLinearGradient : GeneratingBackground {
    fileprivate func createImage(withExtent extent: CGRect) -> CIImage? {
        let rotationRadians = rotationAngle / 180.0 * Double.pi
        let point0 = CGPoint(x: (0.5 - 0.5 * sin(rotationRadians)) * extent.width, y: (0.5 - 0.5 *  cos(rotationRadians)) * extent.height)
        let point1 = CGPoint(x: (0.5 + 0.5 * sin(rotationRadians)) * extent.width, y: (0.5 + 0.5 *  cos(rotationRadians)) * extent.height)
        
        let filter = CIFilter.linearGradient()
        filter.point0 = point0
        filter.point1 = point1
        filter.color0 = color0.ciColor
        filter.color1 = color1.ciColor
        return filter.outputImage?.cropped(to: extent)
    }
}

extension LinearGradient : GeneratingBackground {
    private func createGradient(from color0: Color, to color1: Color, startingAt stop0: CGFloat, endingAt stop1: CGFloat) -> CIImage? {
        let filter = CIFilter.smoothLinearGradient()
        filter.point0 = CGPoint(x: stop0, y: 0)
        filter.point1 = CGPoint(x: stop1, y: 0)
        filter.color0 = color0.ciColor
        filter.color1 = color1.ciColor
        return filter.outputImage
        //?.cropped(to: CGRect(x: 0, y: 0, width: 1, height: 1))
    }
    
    private func createGradientImage() -> CIImage? {
        // check indices
        let indices = colors.indices
        guard indices.count >= 2 else { return nil }
        
        // create base image
        var image: CIImage? = nil
        
        // create and place images
        for i in indices.dropLast() {
            let gradient = createGradient(from: colors[i], to: colors[i+1], startingAt: stops[i], endingAt: stops[i+1])
            guard let gradient else { return nil }
            let croppedGradient = gradient.cropped(to: CGRect(x: stops[i], y: 0, width: stops[i+1] - stops[i], height: 1))
            if image != nil {
                image = croppedGradient.composited(over: image!)
            } else {
                image = croppedGradient
            }
        }
        
        return image
    }
    
    fileprivate func createImage(withExtent extent: CGRect) -> CIImage? {
        /*let rotationRadians = rotationAngle / 180.0 * Double.pi
         let point0 = CGPoint(x: (0.5 - 0.5 * sin(rotationRadians)) * extent.width, y: (0.5 - 0.5 *  cos(rotationRadians)) * extent.height)
         let point1 = CGPoint(x: (0.5 + 0.5 * sin(rotationRadians)) * extent.width, y: (0.5 + 0.5 *  cos(rotationRadians)) * extent.height)
         
         let filter = CIFilter.smoothLinearGradient()
         filter.point0 = point0
         filter.point1 = point1
         filter.color0 = colors[0].ciColor
         filter.color1 = colors[1].ciColor
         return filter.outputImage?.cropped(to: extent)*/
        return createGradientImage()?
            .transformed(by: CGAffineTransform(scaleX: extent.width, y: extent.height))
    }
}

// MARK: TextElement

extension TextElement : ImageCreator {
    private var font: PlatformFont? { PlatformFont(name: fontName, size: CGFloat(fontSize)) }
    
    func createImage(withExtent extent: CGRect) -> CIImage? {
        // https://stackoverflow.com/questions/24666515/how-do-i-make-an-attributed-string-using-swift
        // create text image
        let filter = CIFilter.attributedTextImageGenerator()
        var attributes = [NSAttributedString.Key: Any]()
        attributes[NSAttributedString.Key.foregroundColor] =  color.attributedColor
        if let font = self.font {
            attributes[NSAttributedString.Key.font] = font
        }
        if underline {
            attributes[NSAttributedString.Key.underlineStyle] = NSUnderlineStyle.single.rawValue
        }
        let attributedText = NSAttributedString(string: text, attributes: attributes)
        filter.text = attributedText
        filter.scaleFactor = 1.0
        return filter.outputImage
    }
}

// MARK: ImageFileElement

extension ImageFileElement : ImageCreator {
    func createImage(withExtent extent: CGRect) -> CIImage? {
        return ImageCache.shared.get(image: imageId)?.ciImage
    }
}

extension ScreenshotElement : ImageCreator {
    func createImage(withExtent extent: CGRect) -> CIImage? {
        var image = CIImage(color: CIColor.transparent)
            .cropped(to: extent)
        
        if let screenshotImage = CGImage.named("test-screenshot-ipad")?.ciImage {
            image = screenshotImage
        }
        
        if let bezel,
            let bezelCGImage = ImageCache.shared.get(bezel: bezel) {
            
            let bezelCIImage = bezelCGImage.ciImage
            let bezelExtent = bezelCIImage.extent
            let translation = CGPoint(x: (extent.width - bezelExtent.width) * 0.5, y: (extent.height - bezelExtent.height) * 0.5)
            
            image = bezelCIImage
                .transformed(by: CGAffineTransform(translationX: translation.x, y: translation.y))
                .composited(over: image)
        }
        
        return image
    }
}
