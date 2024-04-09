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
    
    func render(for appStoreDevice: AppStoreDevice) -> CGImage? {
        let context = AppStoreImage.context
        let extent = appStoreDevice.extent
        
        var image = CIImage(color: .black)
            .cropped(to: extent)
        
        // apply background
        image = background.render(into: image, withExtent: extent)
        
        // apply each element
        for element in self.elements {
            image = element.render(into: image, withExtent: extent)
        }
        
        let outputImage = context.createCGImage(image, from: appStoreDevice.extent)
        return outputImage
    }
}

extension Color {
    var cgColor: CGColor { CGColor(red: red, green: green, blue: blue, alpha: alpha) }
    var ciColor: CIColor { CIColor(cgColor: cgColor) }
}
