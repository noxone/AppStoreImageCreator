//
//  SwiftUI+CGImage.swift
//  AppStoreImageCreator
//
//  Created by Olaf Neumann on 01.04.24.
//

import Foundation
import SwiftUI
import CoreGraphics

#if os(macOS)
import AppKit
#else
import UIKit
#endif

extension Image {
    init(cgImage: CGImage) {
#if os(macOS)
        self.init(nsImage: NSImage(cgImage: cgImage, size: NSSize(width: cgImage.width, height: cgImage.height)))
#else
        self.init(uiImage: UIImage(cgImage: cgImage))
#endif
    }
}

extension Color {
#if os(macOS)
    var attributedColor: NSColor { NSColor(ciColor: ciColor) }
#else
    var attributedColor: UIColor { UIColor(cgColor: cgColor) }
#endif
}
