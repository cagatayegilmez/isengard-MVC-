//
//  CategoriesModel.swift
//  Isengard
//
//  Created by Çağatay Eğilmez on 13.04.2019.
//  Copyright © 2019 Isengard. All rights reserved.
//

import Foundation
import ObjectMapper

class CategoriesModel: Mappable {
    
    var id: String!
    var name: String!
    var shortName: String!
    
    
    init(){
    }
    
    required init?(map: Map) {
    }
    
    // Mappable
    func mapping(map: Map) {
        id            <- map["id"]
        name          <- map["name"]
        shortName     <- map["shortName"]
        
    }
}


