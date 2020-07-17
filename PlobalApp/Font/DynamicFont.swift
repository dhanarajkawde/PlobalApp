//
//  DynamicFont.swift
//  PlobalApp
//
//  Created by Dhanraj Kawade on 17/07/20.
//  Copyright © 2020 PlobalApp. All rights reserved.
//

import UIKit

/// Class to Provide Dynamic Font Sizes as per Device
class DynamicFont {

    static let shared = DynamicFont()
    
    //MARK: - PLIST constant for fontSize
    static let FontSizeXXXXXXXS = "FontSizeXXXXXXXS"
    static let FontSizeXXXXXXS = "FontSizeXXXXXXS"
    static let FontSizeXXXXXS = "FontSizeXXXXXS"
    static let FontSizeXXXXS = "FontSizeXXXXS"
    static let FontSizeXXXS = "FontSizeXXXS"
    static let FontSizeXXS = "FontSizeXXS"
    static let FontSizeXS = "FontSizeXS"
    static let FontSizeS = "FontSizeS"
    static let FontSizeM = "FontSizeM"
    static let FontSizeL = "FontSizeL"
    static let FontSizeXL = "FontSizeXL"
    static let FontSizeXXL = "FontSizeXXL"
    static let FontSizeXXXL = "FontSizeXXXL"
    static let FontSizeXXXXL = "FontSizeXXXXL"
    static let FontSizeXXXXXL = "FontSizeXXXXXL"
    static let FontSizeXXXXXXL = "FontSizeXXXXXXL"
    static let FontSizeXXXXXXXL = "FontSizeXXXXXXXL"
    static let FontSizeCellIcon = "FontSizeCellIcon"
    
    static let HelveticaNeue_Regular = "HelveticaNeue"
    static let HelveticaNeue_Bold = "HelveticaNeue-Bold"
    static let HelveticaNeue_Light = "HelveticaNeue-Light"
    
    /// get exact plist
    /// - Parameter plistName: name
    func readPlist(plistName : String) -> String {
        if let path = Bundle.main.path(forResource: plistName, ofType: "plist"){
            return path
        }
        return ""
    }
    
    /// This method returns font according to customer type.
    /// - Parameter size: size of font
    /// - Parameter fontName: font name
    func getSpecificFont(size:String, fontName:String) -> UIFont {
        
        let path = getPathAccToDevice()
        ////If your plist contain root as Dictionary
        if let dic = NSDictionary(contentsOfFile: path) as? [String: Any] {
            
            let fontName = fontName
            let fontSize =  dic[size]! as! CGFloat
            
            return  UIFont(name: fontName, size: fontSize)!
        }
        return UIFont()
    }
    
    /// Function to get the plist of specific device
    ///
    /// - Returns: path in string format
    func getPathAccToDevice()->String
    {
        var path = readPlist(plistName: "iPhone")
        
        switch UIDevice().screenType {
        case .iPhone5:
            path = readPlist(plistName: "iPhone")
            
        case .iPhone6:
            path = readPlist(plistName: "iPhone6")
            
        case .iPhone6Plus:
            path = readPlist(plistName: "iPhonePlus")
            
        case .iPad:
            path = readPlist(plistName: "iPhonePlus")
            
        default: break
        }
        
        return path
    }
}


