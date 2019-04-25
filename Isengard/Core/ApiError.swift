//
//  ApiError.swift
//  Platinum
//
//  Created by Çağatay Eğilmez on 04/10/2017.
//  Copyright © 2017 Çağatay Eğilmez. All rights reserved.
//

import Foundation

enum ApiError: Error {
    
    struct Code {
        var code: Int?
        var description: String?
    }
    case fail(Int?, description: String?)
    
    var handle: Code {
        switch self {
        case .fail(var num, var desc):
            if num == nil  {
                num = 0
            }
            
            if desc == nil {
                desc = "Error"
            }
            return Code(code: num, description: desc)
        }
    }
}
