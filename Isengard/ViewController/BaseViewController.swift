//
//  BaseViewController.swift
//  Isengard
//
//  Created by Çağatay Eğilmez on 13.04.2019.
//  Copyright © 2019 Isengard. All rights reserved.
//

import Foundation
import UIKit
import Fabric
import Crashlytics
import FirebaseAnalytics

class BaseViewController: UIViewController {
    
    let screensize = UIScreen.main.bounds
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = ""
        
        
        self.view.setNeedsUpdateConstraints()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        let backArrowImage = #imageLiteral(resourceName: "Back Chevron")
        let renderedImage = backArrowImage.withRenderingMode(.alwaysOriginal)
        //self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : AppFont.semiBold.pt18, NSAttributedString.Key.foregroundColor: UIColor.black]
        self.navigationController?.navigationBar.backIndicatorImage = renderedImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = renderedImage
        self.navigationController?.navigationBar.backItem?.backBarButtonItem?.imageInsets = UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 0)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


