//
//  LocationModel.swift
//  Isengard
//
//  Created by Çağatay Eğilmez on 13.04.2019.
//  Copyright © 2019 Isengard. All rights reserved.
//

import Foundation
import ObjectMapper

class LocationModel: Mappable {
    
    var address: String!
    var crossStreet: String!
    var city: String!
    var state: String!
    var country: String!
    
    
    init(){
    }
    
    required init?(map: Map) {
    }
    
    // Mappable
    func mapping(map: Map) {
        address      <- map["address"]
        crossStreet  <- map["crossStreet"]
        city         <- map["city"]
        state        <- map["state"]
        country      <- map["country"]
        
    }
}

