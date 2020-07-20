//
//  APIManager.swift
//  PlobalApp
//
//  Created by Dhanraj Kawade on 21/07/20.
//  Copyright © 2020 PlobalApp. All rights reserved.
//

import Foundation

//HTTP Methods
enum HttpMethod : String {
    case  GET
    case  POST
    case  DELETE
    case  PUT
}

class APIManager: NSObject {
    
    //TODO: remove app transport security arbitary constant from info.plist file once we get API's
    var request : URLRequest?
    var session : URLSession?
    let baseUrl = "https://plobalapps.s3-ap-southeast-1.amazonaws.com/dummy-app-data.json"
    
    static let sharedInstance = APIManager()
    
    func makeJsonAPICall(url: String,params: Dictionary<String, Any>?, method: HttpMethod, success:@escaping ( Data?, HTTPURLResponse?, Error? ) -> Void, failure: @escaping ( Data? ,HTTPURLResponse?  , NSError? )-> Void) {
        
        request = URLRequest(url: URL(string: "\(baseUrl)\(url)")!)
        
        if let params = params {
            
            let  jsonData = try? JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
            
            request?.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request?.setValue("application/json", forHTTPHeaderField: "Accept")
            request?.httpBody = jsonData
        }
        request?.httpMethod = method.rawValue
        
        let configuration = URLSessionConfiguration.default
        
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 60
        
        session = URLSession(configuration: configuration)
        
        session?.dataTask(with: request! as URLRequest) { (data, response, error) -> Void in
            
            if let data = data {
                
                success(data, response as? HTTPURLResponse, error as NSError?)

            }else {
                
                failure(data , response as? HTTPURLResponse, error as NSError?)
            }
        }.resume()
    }
    
    func makeFormDataAPICall(url:String, params:[String:Any], method: HttpMethod, finish: @escaping ((message:String, data:Data?)) -> Void)
    {
        var request = URLRequest(url: URL(string: "\(self.baseUrl)\(url)")!)
        request.httpMethod = method.rawValue

        if method == HttpMethod.POST {
            
            let postString = self.getPostString(params: params)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("disableauth", forHTTPHeaderField: "true")
            request.httpBody = postString.data(using: .utf8)
        }
        
        var result:(message:String, data:Data?) = (message: "Fail", data: nil)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            if(error != nil)
            {
                result.message = "Fail Error not null : \(error.debugDescription)"
            }
            else
            {
                result.message = "Success"
                result.data = data
            }

            finish(result)
        }
        task.resume()
    }
    
    func getPostString(params:[String:Any]) -> String
    {
        var data = [String]()
        for(key, value) in params
        {
            data.append(key + "=\(value)")
        }
        return data.map { String($0) }.joined(separator: "&")
    }
}

