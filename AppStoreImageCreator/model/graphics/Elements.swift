//
//  Elements.swift
//  AppStoreImageCreator
//
//  Created by Olaf Neumann on 02.04.24.
//

import Foundation

struct BackgroundColor : Background {
    let color: Color
}

struct BackgroundXfPattern : Background {
    let color: Color
    let symbol: String
}

struct SimpleLinearGradient : Background {
    let rotationAngle: CGFloat
    let color0: Color
    let color1: Color
}

struct LinearGradient : Background {
    let rotationAngle: CGFloat
    let colors: [Color]
    let stops: [CGFloat]
}

struct TextElement {
    let color: Color
    let fontName: String
    let fontSize: Int
    let text: String
    let position: CGPoint
    let underline: Bool
    let rotationAngle: CGFloat
}

struct ImageFileElement {
    let imageId: ImageFileId
    let scale: CGSize
    let position: CGPoint
    let rotationAngle: CGFloat
}

struct ScreenshotElement {
    let screenshot: ScreenshotId
    let bezel: Bezel?
    let imageScale: ImageScale
    let scale: CGSize
    let position: CGPoint
    let rotationAngle: CGFloat
}

enum ImageScale {
    case fit
    case fill
    case crop
    case scale
}
