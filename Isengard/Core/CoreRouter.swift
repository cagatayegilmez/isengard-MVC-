//
//  CoreRouter.swift
//  Isengard
//
//  Created by Çağatay Eğilmez on 13/04/2019.
//  Copyright © 2019 Çağatay Eğilmez. All rights reserved.
//

import Foundation
import Alamofire

public enum CoreRouter : URLRequestConvertible {
    
    static let baseUrl = "https://api.foursquare.com"
    
    
    case GetTrendingVenues([String: AnyObject])
    
    
    
    
    var path: String {
        switch self {
        case .GetTrendingVenues(_):
            return "/v2/venues/search?"
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = URL(string: CoreRouter.baseUrl)!
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        switch self {
        case .GetTrendingVenues(let parameters):
            urlRequest.setValue("V2OSDB2IL3QXAYS4GMOQTAIOCLLGRYLOSVLMHICUPF101Z5N", forHTTPHeaderField: "client_id")
            urlRequest.setValue("XPOK02D3NQFR5RJBX2UEZU1HK2MJTZNALLOYT4VFJEV1SZ3C", forHTTPHeaderField: "client_secret")
            urlRequest.setValue("20190417", forHTTPHeaderField: "v")
            return try Alamofire.JSONEncoding.default.encode(urlRequest, with: parameters)
        }
    }
}
