//
//  Graphics.swift
//  AppStoreImageCreator
//
//  Created by Olaf Neumann on 30.03.24.
//

import Foundation
import UIKit

protocol Drawable {
    
}

struct BackgroundColor : Drawable {
    let color: UIColor
}

struct BackgroundXfPattern : Drawable {
    let color: UIColor
    let symbol: String
}
