//
//  ImageRenderer.swift
//  AppStoreImageCreator
//
//  Created by Olaf Neumann on 30.03.24.
//

import Foundation
import CoreImage
import CoreImage.CIFilterBuiltins
import CoreGraphics

extension AppStoreImage {
    private static let context = CIContext()
    
    func render(for device: Device) -> CGImage? {
        let context = AppStoreImage.context
        let extent = device.bounds
        
        var image = CIImage(color: .black)
        
        // apply background
        image = background.render(into: image, withExtent: extent)
        
        // apply each element
        for element in self.elements {
            image = element.render(into: image, withExtent: extent)
        }
        
        let outputImage = context.createCGImage(image, from: device.bounds)
        return outputImage
    }
}

extension Color {
    var cgColor: CGColor { CGColor(red: red, green: green, blue: blue, alpha: alpha) }
    var ciColor: CIColor { CIColor(cgColor: cgColor) }
}
