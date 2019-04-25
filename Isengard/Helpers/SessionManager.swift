//
//  SessionManager.swift
//  Isengard
//
//  Created by Çağatay Eğilmez on 18.04.2019.
//  Copyright © 2019 Isengard. All rights reserved.
//

import Foundation
import UIKit

class SessionManager {
    static let shared = SessionManager()
    
    var clientID: String = "V2OSDB2IL3QXAYS4GMOQTAIOCLLGRYLOSVLMHICUPF101Z5N"
    var clientSecret: String = "XPOK02D3NQFR5RJBX2UEZU1HK2MJTZNALLOYT4VFJEV1SZ3C"
    
    func setToken(token: String) {
        let defaults = UserDefaults.standard
        defaults.setValue(token, forKey: defaultsKeys.token)
        defaults.synchronize()
    }
    
    var Token : String {
        get {
            let defaults = UserDefaults.standard
            let token = defaults.value(forKeyPath: defaultsKeys.token)
            if token != nil {
                return token  as! String
            }
            return ""
        }
        
    }
}

struct defaultsKeys {
    static let token = "token"
}


