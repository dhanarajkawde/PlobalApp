//
//  CompanyViewModel.swift
//  PlobalApp
//
//  Created by Dhanraj Kawade on 15/07/20.
//  Copyright © 2020 PlobalApp. All rights reserved.
//

import Foundation

/// Class to get and parse List Data
class CompanyViewModel: NSObject {
    
    static let sharedInstance = CompanyViewModel()
    
    /// Parse List
    /// - Parameter completion: List Data
    func getListAPI(completion: @escaping (Company?) -> Void) {
        
        APIManager.sharedInstance.makeJsonAPICall(url: "", params: nil, method: .GET, success: { (data, response, error) in
            
            do
            {
                if let jsonData = data
                {
                    let deal = try JSONDecoder().decode(Company.self, from: jsonData)
                    completion(deal)
                }
            }
            catch
            {
                print("Parse Error: \(error)")
            }
            
        }, failure: { (data, response, error) in
            
            
        })
    }
}
