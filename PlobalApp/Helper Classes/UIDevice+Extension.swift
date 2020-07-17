//
//  UIDevice+Extension.swift
//  PlobalApp
//
//  Created by Dhanraj Kawade on 16/07/20.
//  Copyright © 2020 PlobalApp. All rights reserved.
//

import UIKit

// Common extension of UIDevice
extension UIDevice {
    
    enum UIUserInterfaceIdiom : Int {
        case unspecified

        case phone // iPhone and iPod touch style UI
        case pad   // iPad style UI (also includes macOS Catalyst)
    }
    
    var iPhone: Bool {
        return UIDevice().userInterfaceIdiom == .phone
    }
    
    enum ScreenType: String {
        case iPhone4
        case iPhone5
        case iPhone6
        case iPhone6Plus
        case iPad
    }
    
    var screenType: ScreenType {
        guard iPhone else { return .iPad }
        switch UIScreen.main.nativeBounds.height {
        case 960:
            return .iPhone4
        case 1136:
            return .iPhone5
        case 1334, 2436:
            return .iPhone6
        case 1792, 1920, 2208, 2688:
            return .iPhone6Plus
        default:
            return .iPad
        }
    }
}
