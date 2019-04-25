//
//  ApiFactoryHandler.swift
//  PinarSu
//
//  Created by Çağatay Eğilmez on 15.10.2018.
//  Copyright © 2018 Çağatay Eğilmez. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import PromiseKit
import AlamofireObjectMapper

class ApiResponseHandler {
    
    public class func getResultAsBoolean(data: Data?) -> Bool {
        guard let data = data else {
            return false
        }
        
        let response = String(data: data, encoding: String.Encoding.utf8)
        if let responseAsBool = Bool(response!) {
            return responseAsBool
        }
        
        return false
    }
    
    
    public class func getResultAsString(data: Data?) -> String {
        guard let data = data else {
            return ""
        }
        let response = String(data: data, encoding: String.Encoding.utf8)
        return response ?? ""
    }
    
    public class func getErrorMessageAsString(data: Data?) -> String {
        
        if let result = data {
            do {
                let responseJson = try JSON(data: result)
                if responseJson != JSON.null && responseJson["Message"].exists() {
                    return responseJson["Message"].stringValue
                    
                } else if responseJson != JSON.null && responseJson["error"].exists() {
                    return responseJson["error"].stringValue
                }
            } catch {
                guard let data = data else {
                    return ""
                }
                
                
                let response = String(data: data, encoding: String.Encoding.utf8)
                return response ?? "General Error"
            }
        }
        return "General Error"
    }
    
}

