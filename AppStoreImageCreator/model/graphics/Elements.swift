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

struct TextElement {
    let color: Color
    let fontName: String
    let fontSize: Int
    let text: String
    let position: CGPoint
    let underline: Bool
    let rotationAngle: CGFloat
}

struct ImageElement {
    let imageName: String
}
