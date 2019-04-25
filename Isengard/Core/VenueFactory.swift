//
//  VenueFactory.swift
//  Isengard
//
//  Created by Çağatay Eğilmez on 13/04/2019.
//  Copyright © 2019 Çağatay Eğilmez. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import PromiseKit

class VenueFactory {
    
        class func GetVenueList(ll: String, near: String) -> Promise<[VenueListModel]> {
            return Promise { seal in
                let parameters: [String: AnyObject] = [
                    "ll" : ll as AnyObject,
                    "near" : near as AnyObject
                ]
                Alamofire.request(CoreRouter.GetTrendingVenues(parameters)).validate().responseArray { (response: DataResponse<[VenueListModel]>) in
                    switch response.result {
                    case .success(_):
                        let result = response.result.value!
                        seal.fulfill(result)
                    case .failure(_):
                        let error = ApiResponseHandler.getErrorMessageAsString(data: response.data)
                        seal.reject(ApiError.fail(response.response?.statusCode, description: error))
                    }
                }
            }
        }
    
}


