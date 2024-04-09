//
//  AppStoreDevice.swift
//  AppStoreImageCreator
//
//  Created by Olaf Neumann on 07.04.24.
//

import Foundation

enum AppStoreDevice {
    case iPhone6_7
    case iPhone6_5
    case iPhone6_1
    case iPhone5_8
    case iPhone5_5
    case iPhone4_7
    case iPhone4_0
    case iPhone3_5
    case iPadPro12_9
    case iPadPro11_0
    case iPadCorner12_9
    case iPad10_5
    case iPad9_7
    
    var screenshotSize: [CGSize] {
        switch self {
            case .iPhone6_7:
                return [CGSize(width: 1290, height: 2796)]
            case .iPhone6_5:
                return [CGSize(width: 1242, height: 2688)]
            case .iPhone6_1:
                return [CGSize(width: 1179, height: 2556)]
            case .iPhone5_8:
                return [CGSize(width: 1125, height: 2436), CGSize(width: 1080, height: 2340), CGSize(width: 1170, height: 2532)]
            case .iPhone5_5:
                return [CGSize(width: 1242, height: 2208)]
            case .iPhone4_7:
                return [CGSize(width: 750, height: 1334)]
            case .iPhone4_0:
                return [CGSize(width: 640, height: 1096), CGSize(width: 640, height: 1136)]
            case .iPhone3_5:
                return [CGSize(width: 640, height: 920)]
            case .iPadPro12_9, .iPadCorner12_9:
                return [CGSize(width: 2048, height: 2732)]
            case .iPadPro11_0:
                return [CGSize(width: 1668, height: 2388), CGSize(width: 1640, height: 2360)]
            case .iPad10_5:
                return [CGSize(width: 1668, height: 2224)]
            case .iPad9_7:
                return [CGSize(width: 1536, height: 2008), CGSize(width: 1536, height: 2048)]
        }
    }
    
    var extent: CGRect {
        let size = screenshotSize.first!
        return CGRect(x: 0, y: 0, width: size.width, height: size.height)
    }
    
    var bezelResourceNames: [String] {
        switch self {
            case .iPhone6_7:
                return [
                    "bezel_iPhone_15_Black",
                    "bezel_iPhone_15_Blue",
                    "bezel_iPhone_15_Green",
                    "bezel_iPhone_15_Pink",
                    "bezel_iPhone_15_Yellow",
                    "bezel_iPhone_15_Pro_Black",
                    "bezel_iPhone_15_Pro_Blue",
                    "bezel_iPhone_15_Pro_Nature",
                    "bezel_iPhone_15_Pro_White"
                ]
            default:
                return ["bezel_iPhone_15_Pink"]
        }
    }
}
