//
//  CompanyDetails.swift
//  PlobalApp
//
//  Created by Dhanraj Kawade on 15/07/20.
//  Copyright © 2020 PlobalApp. All rights reserved.
//

import Foundation

struct Company : Codable {
    
    var apps:[CompanyDetails]?
}

struct CompanyDetails : Codable {
    
    var name:String?
    var currency:String?
    var money_format:String?
    var data:CompanyData?
}

struct CompanyData : Codable {
    
    var downloads:CommonData?
    var sessions:CommonData?
    var total_sale:CommonData?
    var add_to_cart:CommonData?
}

struct CommonData : Codable {
    
    var total:Int?
    var month_wise:MonthWise?
}

struct MonthWise : Codable {
    
    var jan:Int?
    var feb:Int?
    var mar:Int?
    var apr:Int?
    var may:Int?
    var jun:Int?
    
    var arrMonth:[Int] {
        get {
            return [self.jan ?? 0, self.feb ?? 0, self.mar ?? 0, self.apr ?? 0, self.may ?? 0, self.jun ?? 0] as [Int]
        }
    }
}
