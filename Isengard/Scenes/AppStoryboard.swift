//
//  AppStoryboard.swift
//  Isengard
//
//  Created by Çağatay Eğilmez on 17.04.2019.
//  Copyright © 2019 Isengard. All rights reserved.
//

import Foundation
import UIKit

enum AppStoryboard: String {
    
    case Main = "Main"
    
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func view<T: UIViewController>(controllerClass: T.Type) -> T {
        let storyboardID = (controllerClass as UIViewController.Type).storyboardID
        guard let scene = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            fatalError("ViewController with identifier \(storyboardID), not found in \(self.rawValue) Storyboard")
        }
        
        return scene
    }
    
}

extension UIViewController {
    class var storyboardID : String {
        return "\(self)"
    }
}

