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

#if os(macOS)
typealias PlatformFont = NSFont
#else
typealias PlatformFont = UIFont
#endif


protocol Renderable {
    func render(into baseImage: CIImage, withExtent extent: CGRect) -> CIImage
}

extension Renderable {
    fileprivate func render(_ imageToRender: CIImage, over baseImage: CIImage, scaling scale: CGPoint, rotating rotationAngle: CGFloat, positionedAt position: CGPoint) -> CIImage {
        let imageToRenderExtent = imageToRender.extent
        let baseImageExtent = baseImage.extent
        
        return imageToRender
            .transformed(by: CGAffineTransform(translationX: imageToRenderExtent.width * -0.5, y: imageToRenderExtent.height * -0.5))
            .transformed(by: CGAffineTransform(scaleX: scale.x, y: scale.y))
            .transformed(by: CGAffineTransform(rotationAngle: rotationAngle / 180.0 * Double.pi))
            .transformed(by: CGAffineTransform(translationX: baseImageExtent.width * position.x, y: baseImageExtent.height * (1.0 - position.y)))
            .composited(over: baseImage)
    }
}

extension BackgroundColor : Renderable {
    func render(into image: CIImage, withExtent extent: CGRect) -> CIImage {
        let filter = CIFilter.roundedRectangleGenerator()
        filter.color = color.ciColor
        filter.radius = 0.0
        filter.extent = extent
        return filter.outputImage!
    }
}

extension TextElement : Renderable {
    private var font: PlatformFont? { PlatformFont(name: fontName, size: CGFloat(fontSize)) }
    
    private func createTextImage() -> CIImage? {
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
    
    func render(into baseImage: CIImage, withExtent extent: CGRect) -> CIImage {
        guard let imageToRender = createTextImage() else {
            // TODO: Log warning
            return baseImage
        }
        
        return render(imageToRender,
                      over: baseImage,
                      scaling: CGPoint(x: 1.0, y: 1.0),
                      rotating: rotationAngle,
                      positionedAt: position)
    }
}

extension ImageFileElement : Renderable {
    func render(into baseImage: CIImage, withExtent extent: CGRect) -> CIImage {
        guard let imageToRender = ImageCache.shared.getImage(of: imageId) else {
            // TODO: Log warning
            return baseImage
        }
        
        return render(CIImage(cgImage: imageToRender), 
                      over: baseImage,
                      scaling: CGPoint(x: scaleX, y: scaleY),
                      rotating: rotationAngle,
                      positionedAt: position)
    }
}
