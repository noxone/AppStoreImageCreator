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

protocol Renderable {
    func render(into image: CIImage, withExtent extent: CGRect) -> CIImage
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
#if os(macOS)
    private var font: NSFont { NSFont(name: fontName, size: CGFloat(fontSize))! }
#else
    private var font: UIFont { UIFont(name: fontName, size: CGFloat(fontSize))! }
#endif
    
    // https://stackoverflow.com/questions/24666515/how-do-i-make-an-attributed-string-using-swift
    func render(into image: CIImage, withExtent extent: CGRect) -> CIImage {
        // create text image
        let filter = CIFilter.attributedTextImageGenerator()
        var attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: color.attributedColor,
            NSAttributedString.Key.font: font,
        ]
        if underline {
            attributes[NSAttributedString.Key.underlineStyle] = NSUnderlineStyle.single.rawValue
        }
        let attributedText = NSAttributedString(string: text, attributes: attributes)
        filter.text = attributedText
        filter.scaleFactor = 1.0
        let textImage = filter.outputImage!
        
        //https://stackoverflow.com/questions/8275882/one-step-affine-transform-for-rotation-around-a-point 
        // compute position
        let textImageExtent = textImage.extent
        let position = CGPoint(x: position.x * extent.width - textImageExtent.width * 0.5, y: (1.0 - position.y) * extent.height - textImageExtent.height * 0.5)
        let a = rotationAngle / 180.0 * Double.pi
        //let x = textImageExtent.height * 0.5
        //let y = textImageExtent.width * 0.5
        //let transform = CGAffineTransform(cos(a), sin(a),-sin(a),cos(a),x-x*cos(a)+y*sin(a),y-x*sin(a)-y*cos(a))
            //.translatedBy(x: position.x * extent.width, y: (1.0 - position.y) * extent.height)
        //let transform = CGAffineTransform(translationX: -x, y: -y)
          //  .rotated(by: a)
            //.translatedBy(x: position.x * extent.width, y: (1.0 - position.y) * extent.height)
        //let positionedTextImage = textImage.transformed(by: transform)
        let positionedTextImage = textImage.transformed(by: CGAffineTransform(translationX: position.x, y: position.y).rotated(by: a))
        
        // rotation
        //let rotatedTextImage = positionedTextImage.transformed(by: CGAffineTransform(rotationAngle: rotationAngle / Double.pi))
        //let rotatedTextImage = textImage.transformed(by: CGAffineTransform(rotationAngle: 0.1).)
        
        // combine images
        return positionedTextImage.composited(over: image)
    }
}
