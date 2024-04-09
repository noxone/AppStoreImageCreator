//
//  Devices.swift
//  AppStoreImageCreator
//
//  Created by Olaf Neumann on 30.03.24.
//

import Foundation

enum AppleDevice : String, Equatable, Hashable {
    case iPhone1_1 // iPhone
    case iPhone1_2 // iPhone 3G
    case iPhone2_1 // iPhone 3GS
    case iPhone3_1 // iPhone 4
    case iPhone3_2 // iPhone 4 GSM Rev A
    case iPhone3_3 // iPhone 4 CDMA
    case iPhone4_1 // iPhone 4S
    case iPhone5_1 // iPhone 5 (GSM)
    case iPhone5_2 // iPhone 5 (GSM+CDMA)
    case iPhone5_3 // iPhone 5C (GSM)
    case iPhone5_4 // iPhone 5C (Global)
    case iPhone6_1 // iPhone 5S (GSM)
    case iPhone6_2 // iPhone 5S (Global)
    case iPhone7_1 // iPhone 6 Plus
    case iPhone7_2 // iPhone 6
    case iPhone8_1 // iPhone 6s
    case iPhone8_2 // iPhone 6s Plus
    case iPhone8_4 // iPhone SE (GSM)
    case iPhone9_1 // iPhone 7
    case iPhone9_2 // iPhone 7 Plus
    case iPhone9_3 // iPhone 7
    case iPhone9_4 // iPhone 7 Plus
    case iPhone10_1 // iPhone 8
    case iPhone10_2 // iPhone 8 Plus
    case iPhone10_3 // iPhone X Global
    case iPhone10_4 // iPhone 8
    case iPhone10_5 // iPhone 8 Plus
    case iPhone10_6 // iPhone X GSM
    case iPhone11_2 // iPhone XS
    case iPhone11_4 // iPhone XS Max
    case iPhone11_6 // iPhone XS Max Global
    case iPhone11_8 // iPhone XR
    case iPhone12_1 // iPhone 11
    case iPhone12_3 // iPhone 11 Pro
    case iPhone12_5 // iPhone 11 Pro Max
    case iPhone12_8 // iPhone SE 2nd Gen
    case iPhone13_1 // iPhone 12 Mini
    case iPhone13_2 // iPhone 12
    case iPhone13_3 // iPhone 12 Pro
    case iPhone13_4 // iPhone 12 Pro Max
    case iPhone14_2 // iPhone 13 Pro
    case iPhone14_3 // iPhone 13 Pro Max
    case iPhone14_4 // iPhone 13 Mini
    case iPhone14_5 // iPhone 13
    case iPhone14_6 // iPhone SE 3rd Gen
    case iPhone14_7 // iPhone 14
    case iPhone14_8 // iPhone 14 Plus
    case iPhone15_2 // iPhone 14 Pro
    case iPhone15_3 // iPhone 14 Pro Max
    case iPhone15_4 // iPhone 15
    case iPhone15_5 // iPhone 15 Plus
    case iPhone16_1 // iPhone 15 Pro
    case iPhone16_2 // iPhone 15 Pro Max
    case iPad1_1 // iPad
    case iPad1_2 // iPad 3G
    case iPad2_1 // 2nd Gen iPad
    case iPad2_2 // 2nd Gen iPad GSM
    case iPad2_3 // 2nd Gen iPad CDMA
    case iPad2_4 // 2nd Gen iPad New Revision
    case iPad3_1 // 3rd Gen iPad
    case iPad3_2 // 3rd Gen iPad CDMA
    case iPad3_3 // 3rd Gen iPad GSM
    case iPad2_5 // iPad mini
    case iPad2_6 // iPad mini GSM+LTE
    case iPad2_7 // iPad mini CDMA+LTE
    case iPad3_4 // 4th Gen iPad
    case iPad3_5 // 4th Gen iPad GSM+LTE
    case iPad3_6 // 4th Gen iPad CDMA+LTE
    case iPad4_1 // iPad Air (WiFi)
    case iPad4_2 // iPad Air (GSM+CDMA)
    case iPad4_3 // 1st Gen iPad Air (China)
    case iPad4_4 // iPad mini Retina (WiFi)
    case iPad4_5 // iPad mini Retina (GSM+CDMA)
    case iPad4_6 // iPad mini Retina (China)
    case iPad4_7 // iPad mini 3 (WiFi)
    case iPad4_8 // iPad mini 3 (GSM+CDMA)
    case iPad4_9 // iPad Mini 3 (China)
    case iPad5_1 // iPad mini 4 (WiFi)
    case iPad5_2 // 4th Gen iPad mini (WiFi+Cellular)
    case iPad5_3 // iPad Air 2 (WiFi)
    case iPad5_4 // iPad Air 2 (Cellular)
    case iPad6_3 // iPad Pro (9.7 inch, WiFi)
    case iPad6_4 // iPad Pro (9.7 inch, WiFi+LTE)
    case iPad6_7 // iPad Pro (12.9 inch, WiFi)
    case iPad6_8 // iPad Pro (12.9 inch, WiFi+LTE)
    case iPad6_11 // iPad (2017)
    case iPad6_12 // iPad (2017)
    case iPad7_1 // iPad Pro 2nd Gen (WiFi)
    case iPad7_2 // iPad Pro 2nd Gen (WiFi+Cellular)
    case iPad7_3 // iPad Pro 10.5-inch 2nd Gen
    case iPad7_4 // iPad Pro 10.5-inch 2nd Gen
    case iPad7_5 // iPad 6th Gen (WiFi)
    case iPad7_6 // iPad 6th Gen (WiFi+Cellular)
    case iPad7_11 // iPad 7th Gen 10.2-inch (WiFi)
    case iPad7_12 // iPad 7th Gen 10.2-inch (WiFi+Cellular)
    case iPad8_1 // iPad Pro 11 inch 3rd Gen (WiFi)
    case iPad8_2 // iPad Pro 11 inch 3rd Gen (1TB, WiFi)
    case iPad8_3 // iPad Pro 11 inch 3rd Gen (WiFi+Cellular)
    case iPad8_4 // iPad Pro 11 inch 3rd Gen (1TB, WiFi+Cellular)
    case iPad8_5 // iPad Pro 12.9 inch 3rd Gen (WiFi)
    case iPad8_6 // iPad Pro 12.9 inch 3rd Gen (1TB, WiFi)
    case iPad8_7 // iPad Pro 12.9 inch 3rd Gen (WiFi+Cellular)
    case iPad8_8 // iPad Pro 12.9 inch 3rd Gen (1TB, WiFi+Cellular)
    case iPad8_9 // iPad Pro 11 inch 4th Gen (WiFi)
    case iPad8_10 // iPad Pro 11 inch 4th Gen (WiFi+Cellular)
    case iPad8_11 // iPad Pro 12.9 inch 4th Gen (WiFi)
    case iPad8_12 // iPad Pro 12.9 inch 4th Gen (WiFi+Cellular)
    case iPad11_1 // iPad mini 5th Gen (WiFi)
    case iPad11_2 // iPad mini 5th Gen
    case iPad11_3 // iPad Air 3rd Gen (WiFi)
    case iPad11_4 // iPad Air 3rd Gen
    case iPad11_6 // iPad 8th Gen (WiFi)
    case iPad11_7 // iPad 8th Gen (WiFi+Cellular)
    case iPad12_1 // iPad 9th Gen (WiFi)
    case iPad12_2 // iPad 9th Gen (WiFi+Cellular)
    case iPad14_1 // iPad mini 6th Gen (WiFi)
    case iPad14_2 // iPad mini 6th Gen (WiFi+Cellular)
    case iPad13_1 // iPad Air 4th Gen (WiFi)
    case iPad13_2 // iPad Air 4th Gen (WiFi+Cellular)
    case iPad13_4 // iPad Pro 11 inch 5th Gen
    case iPad13_5 // iPad Pro 11 inch 5th Gen
    case iPad13_6 // iPad Pro 11 inch 5th Gen
    case iPad13_7 // iPad Pro 11 inch 5th Gen
    case iPad13_8 // iPad Pro 12.9 inch 5th Gen
    case iPad13_9 // iPad Pro 12.9 inch 5th Gen
    case iPad13_10 // iPad Pro 12.9 inch 5th Gen
    case iPad13_11 // iPad Pro 12.9 inch 5th Gen
    case iPad13_16 // iPad Air 5th Gen (WiFi)
    case iPad13_17 // iPad Air 5th Gen (WiFi+Cellular)
    case iPad13_18 // iPad 10th Gen
    case iPad13_19 // iPad 10th Gen
    case iPad14_3 // iPad Pro 11 inch 4th Gen
    case iPad14_4 // iPad Pro 11 inch 4th Gen
    case iPad14_5 // iPad Pro 12.9 inch 6th Gen
    case iPad14_6 // iPad Pro 12.9 inch 6th Gen
    case dummy
    
    var bounds: CGRect {
        CGRect(x: 0, y: 0, width: 1000, height: 1000)
    }
    
    var userSelectable: Bool {
        self != .dummy
    }
    
    var deviceName: String {
        switch self {
            case .iPhone1_1: return "iPhone"
            case .iPhone1_2: return "iPhone 3G"
            case .iPhone2_1: return "iPhone 3GS"
            case .iPhone3_1: return "iPhone 4"
            case .iPhone3_2: return "iPhone 4 GSM Rev A"
            case .iPhone3_3: return "iPhone 4 CDMA"
            case .iPhone4_1: return "iPhone 4S"
            case .iPhone5_1: return "iPhone 5 (GSM)"
            case .iPhone5_2: return "iPhone 5 (GSM+CDMA)"
            case .iPhone5_3: return "iPhone 5C (GSM)"
            case .iPhone5_4: return "iPhone 5C (Global)"
            case .iPhone6_1: return "iPhone 5S (GSM)"
            case .iPhone6_2: return "iPhone 5S (Global)"
            case .iPhone7_1: return "iPhone 6 Plus"
            case .iPhone7_2: return "iPhone 6"
            case .iPhone8_1: return "iPhone 6s"
            case .iPhone8_2: return "iPhone 6s Plus"
            case .iPhone8_4: return "iPhone SE (GSM)"
            case .iPhone9_1: return "iPhone 7"
            case .iPhone9_2: return "iPhone 7 Plus"
            case .iPhone9_3: return "iPhone 7"
            case .iPhone9_4: return "iPhone 7 Plus"
            case .iPhone10_1: return "iPhone 8"
            case .iPhone10_2: return "iPhone 8 Plus"
            case .iPhone10_3: return "iPhone X Global"
            case .iPhone10_4: return "iPhone 8"
            case .iPhone10_5: return "iPhone 8 Plus"
            case .iPhone10_6: return "iPhone X GSM"
            case .iPhone11_2: return "iPhone XS"
            case .iPhone11_4: return "iPhone XS Max"
            case .iPhone11_6: return "iPhone XS Max Global"
            case .iPhone11_8: return "iPhone XR"
            case .iPhone12_1: return "iPhone 11"
            case .iPhone12_3: return "iPhone 11 Pro"
            case .iPhone12_5: return "iPhone 11 Pro Max"
            case .iPhone12_8: return "iPhone SE 2nd Gen"
            case .iPhone13_1: return "iPhone 12 Mini"
            case .iPhone13_2: return "iPhone 12"
            case .iPhone13_3: return "iPhone 12 Pro"
            case .iPhone13_4: return "iPhone 12 Pro Max"
            case .iPhone14_2: return "iPhone 13 Pro"
            case .iPhone14_3: return "iPhone 13 Pro Max"
            case .iPhone14_4: return "iPhone 13 Mini"
            case .iPhone14_5: return "iPhone 13"
            case .iPhone14_6: return "iPhone SE 3rd Gen"
            case .iPhone14_7: return "iPhone 14"
            case .iPhone14_8: return "iPhone 14 Plus"
            case .iPhone15_2: return "iPhone 14 Pro"
            case .iPhone15_3: return "iPhone 14 Pro Max"
            case .iPhone15_4: return "iPhone 15"
            case .iPhone15_5: return "iPhone 15 Plus"
            case .iPhone16_1: return "iPhone 15 Pro"
            case .iPhone16_2: return "iPhone 15 Pro Max"
            case .iPad1_1: return "iPad"
            case .iPad1_2: return "iPad 3G"
            case .iPad2_1: return "2nd Gen iPad"
            case .iPad2_2: return "2nd Gen iPad GSM"
            case .iPad2_3: return "2nd Gen iPad CDMA"
            case .iPad2_4: return "2nd Gen iPad New Revision"
            case .iPad3_1: return "3rd Gen iPad"
            case .iPad3_2: return "3rd Gen iPad CDMA"
            case .iPad3_3: return "3rd Gen iPad GSM"
            case .iPad2_5: return "iPad mini"
            case .iPad2_6: return "iPad mini GSM+LTE"
            case .iPad2_7: return "iPad mini CDMA+LTE"
            case .iPad3_4: return "4th Gen iPad"
            case .iPad3_5: return "4th Gen iPad GSM+LTE"
            case .iPad3_6: return "4th Gen iPad CDMA+LTE"
            case .iPad4_1: return "iPad Air (WiFi)"
            case .iPad4_2: return "iPad Air (GSM+CDMA)"
            case .iPad4_3: return "1st Gen iPad Air (China)"
            case .iPad4_4: return "iPad mini Retina (WiFi)"
            case .iPad4_5: return "iPad mini Retina (GSM+CDMA)"
            case .iPad4_6: return "iPad mini Retina (China)"
            case .iPad4_7: return "iPad mini 3 (WiFi)"
            case .iPad4_8: return "iPad mini 3 (GSM+CDMA)"
            case .iPad4_9: return "iPad Mini 3 (China)"
            case .iPad5_1: return "iPad mini 4 (WiFi)"
            case .iPad5_2: return "4th Gen iPad mini (WiFi+Cellular)"
            case .iPad5_3: return "iPad Air 2 (WiFi)"
            case .iPad5_4: return "iPad Air 2 (Cellular)"
            case .iPad6_3: return "iPad Pro (9.7 inch, WiFi)"
            case .iPad6_4: return "iPad Pro (9.7 inch, WiFi+LTE)"
            case .iPad6_7: return "iPad Pro (12.9 inch, WiFi)"
            case .iPad6_8: return "iPad Pro (12.9 inch, WiFi+LTE)"
            case .iPad6_11: return "iPad (2017)"
            case .iPad6_12: return "iPad (2017)"
            case .iPad7_1: return "iPad Pro 2nd Gen (WiFi)"
            case .iPad7_2: return "iPad Pro 2nd Gen (WiFi+Cellular)"
            case .iPad7_3: return "iPad Pro 10.5-inch 2nd Gen"
            case .iPad7_4: return "iPad Pro 10.5-inch 2nd Gen"
            case .iPad7_5: return "iPad 6th Gen (WiFi)"
            case .iPad7_6: return "iPad 6th Gen (WiFi+Cellular)"
            case .iPad7_11: return "iPad 7th Gen 10.2-inch (WiFi)"
            case .iPad7_12: return "iPad 7th Gen 10.2-inch (WiFi+Cellular)"
            case .iPad8_1: return "iPad Pro 11 inch 3rd Gen (WiFi)"
            case .iPad8_2: return "iPad Pro 11 inch 3rd Gen (1TB, WiFi)"
            case .iPad8_3: return "iPad Pro 11 inch 3rd Gen (WiFi+Cellular)"
            case .iPad8_4: return "iPad Pro 11 inch 3rd Gen (1TB, WiFi+Cellular)"
            case .iPad8_5: return "iPad Pro 12.9 inch 3rd Gen (WiFi)"
            case .iPad8_6: return "iPad Pro 12.9 inch 3rd Gen (1TB, WiFi)"
            case .iPad8_7: return "iPad Pro 12.9 inch 3rd Gen (WiFi+Cellular)"
            case .iPad8_8: return "iPad Pro 12.9 inch 3rd Gen (1TB, WiFi+Cellular)"
            case .iPad8_9: return "iPad Pro 11 inch 4th Gen (WiFi)"
            case .iPad8_10: return "iPad Pro 11 inch 4th Gen (WiFi+Cellular)"
            case .iPad8_11: return "iPad Pro 12.9 inch 4th Gen (WiFi)"
            case .iPad8_12: return "iPad Pro 12.9 inch 4th Gen (WiFi+Cellular)"
            case .iPad11_1: return "iPad mini 5th Gen (WiFi)"
            case .iPad11_2: return "iPad mini 5th Gen"
            case .iPad11_3: return "iPad Air 3rd Gen (WiFi)"
            case .iPad11_4: return "iPad Air 3rd Gen"
            case .iPad11_6: return "iPad 8th Gen (WiFi)"
            case .iPad11_7: return "iPad 8th Gen (WiFi+Cellular)"
            case .iPad12_1: return "iPad 9th Gen (WiFi)"
            case .iPad12_2: return "iPad 9th Gen (WiFi+Cellular)"
            case .iPad14_1: return "iPad mini 6th Gen (WiFi)"
            case .iPad14_2: return "iPad mini 6th Gen (WiFi+Cellular)"
            case .iPad13_1: return "iPad Air 4th Gen (WiFi)"
            case .iPad13_2: return "iPad Air 4th Gen (WiFi+Cellular)"
            case .iPad13_4: return "iPad Pro 11 inch 5th Gen"
            case .iPad13_5: return "iPad Pro 11 inch 5th Gen"
            case .iPad13_6: return "iPad Pro 11 inch 5th Gen"
            case .iPad13_7: return "iPad Pro 11 inch 5th Gen"
            case .iPad13_8: return "iPad Pro 12.9 inch 5th Gen"
            case .iPad13_9: return "iPad Pro 12.9 inch 5th Gen"
            case .iPad13_10: return "iPad Pro 12.9 inch 5th Gen"
            case .iPad13_11: return "iPad Pro 12.9 inch 5th Gen"
            case .iPad13_16: return "iPad Air 5th Gen (WiFi)"
            case .iPad13_17: return "iPad Air 5th Gen (WiFi+Cellular)"
            case .iPad13_18: return "iPad 10th Gen"
            case .iPad13_19: return "iPad 10th Gen"
            case .iPad14_3: return "iPad Pro 11 inch 4th Gen"
            case .iPad14_4: return "iPad Pro 11 inch 4th Gen"
            case .iPad14_5: return "iPad Pro 12.9 inch 6th Gen"
            case .iPad14_6: return "iPad Pro 12.9 inch 6th Gen"
            default:
                return "dummy"
        }
    }
}
