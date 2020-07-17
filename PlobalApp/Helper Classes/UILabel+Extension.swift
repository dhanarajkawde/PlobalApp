//
//  UILabel+Extension.swift
//  PlobalApp
//
//  Created by Dhanraj Kawade on 16/07/20.
//  Copyright © 2020 PlobalApp. All rights reserved.
//

import UIKit

// Common extension of UILabel
extension UILabel {
    
    /// Set Content, Font, Color
    /// - Parameters:
    ///   - title: value of test
    ///   - fontSize: font size
    ///   - FontName: font name
    ///   - textColor: text color
    func setContentForLabel(title:String, fontSize:String, FontName:String, textColor:UIColor) {
        
        self.text = title
        self.font = DynamicFont.shared.getSpecificFont(size: fontSize, fontName: FontName)
        self.textColor = textColor
    }
}
