//
//  UIView+Extension.swift
//  PlobalApp
//
//  Created by Dhanraj Kawade on 16/07/20.
//  Copyright © 2020 PlobalApp. All rights reserved.
//

import UIKit

enum DropShadowType {
    case rect, circle, dynamic
}

enum ViewSide {
    case Left, Right, Top, Bottom
}

// Common extension of UIView
extension UIView {
    
    /// Add shadow
    /// - Parameters:
    ///   - offset: offset
    ///   - color: color
    ///   - radius: corner radius
    ///   - opacity: opacity
    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.rasterizationScale = 1
        
        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
    }
}
