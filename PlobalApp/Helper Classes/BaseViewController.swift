//
//  BaseViewController.swift
//  PlobalApp
//
//  Created by Dhanraj Kawade on 16/07/20.
//  Copyright © 2020 PlobalApp. All rights reserved.
//

import UIKit
import DropDown

/// Base class for All controller.
class BaseViewController: UIViewController {

    let singleSelectionListDropDown = DropDown()
    
    /// Show dropdown
    /// - Parameter anchorView: below view
    /// - Parameter data: data
    func showSingleSelectionListDropdown(anchorView:UIView, data:[String]) {
        
        self.singleSelectionListDropDown.anchorView = anchorView
        self.singleSelectionListDropDown.textFont = DynamicFont.shared.getSpecificFont(size: DynamicFont.FontSizeXXXXS, fontName: DynamicFont.HelveticaNeue_Bold)
        self.singleSelectionListDropDown.bottomOffset = CGPoint(x: -50, y: anchorView.bounds.height)
        self.singleSelectionListDropDown.dataSource = data
        self.singleSelectionListDropDown.backgroundColor = .white
        self.singleSelectionListDropDown.cornerRadius = 5
        self.singleSelectionListDropDown.textColor = UIColor.black
        
        self.singleSelectionListDropDown.show()
    }
    
    /// hide dropdown
    func hideDropdown() {
        
        self.singleSelectionListDropDown.hide()
    }

}
