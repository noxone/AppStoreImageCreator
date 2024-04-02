//
//  Graphics.swift
//  AppStoreImageCreator
//
//  Created by Olaf Neumann on 30.03.24.
//

import Foundation

struct Color {
    let red: Double
    let green: Double
    let blue: Double
    let alpha: Double
    
    init(red: Double, green: Double, blue: Double, alpha: Double) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
    
    init(red: Double = 0.0, green: Double = 0.0, blue: Double = 0.0) {
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    init() {
        self.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
}

protocol Background {
}

