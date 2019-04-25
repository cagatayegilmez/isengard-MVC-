//
//  MainViewController.swift
//  Isengard
//
//  Created by Çağatay Eğilmez on 13.04.2019.
//  Copyright © 2019 Isengard. All rights reserved.
//

import UIKit
import Foundation

class MainViewController: BaseViewController, UITextFieldDelegate {
    
    @IBOutlet weak var typeField: UITextField!
    @IBOutlet weak var nearField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    
    var didSetupConstraints = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Main Page"
        
        typeField.placeholder = "Exp. Cafe, Bar"
        typeField.keyboardType = .asciiCapable
        typeField.delegate = self
        
        nearField.placeholder = "Close to me"
        
        searchButton.backgroundColor = .templateColor
        searchButton.setTitle("Search", for: .normal)
        searchButton.setTitleColor(.white, for: .normal)
        searchButton.setImage(#imageLiteral(resourceName: "Search Icon.png").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: (self.screensize.width-25)/2)
        searchButton.addTarget(self, action: #selector(self.openList), for: .touchUpInside)
        
        self.view.setNeedsUpdateConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
//        let statuscode: FSOAuthStatusCode = FSOAuth.shared().authorizeUser(usingClientId:SessionManager.shared.clientID,
//                                                                           nativeURICallbackString: "http://com.isengard.ios",
//                                                                           universalURICallbackString: nil,
//                                                                           allowShowingAppStore: true,
//                                                                           presentFrom: self)
//        var resultText: String = ""
//        switch(statuscode) {
//        case FSOAuthStatusCode.success:
//            resultText = "Success"
//            break
//        case FSOAuthStatusCode.errorInvalidCallback:
//            resultText = "Invalid callback URI"
//            break
//        case FSOAuthStatusCode.errorFoursquareNotInstalled:
//            resultText = "Foursquare is not installed"
//            break
//        case FSOAuthStatusCode.errorInvalidClientID:
//            resultText = "Invalid client id"
//            break
//        case FSOAuthStatusCode.errorFoursquareOAuthNotSupported:
//            resultText = "Installed FSQ App doesn't support oauth"
//            break
//        default:
//            resultText = "Unknown status code returned"
//            break
//        }
//        print(resultText)
        
        FSOAuth.shared().requestAccessToken(forCode: SessionManager.shared.Token,
                                            clientId: SessionManager.shared.clientID,
                                            callbackURIString: "http://com.isengard.ios",
                                            clientSecret: SessionManager.shared.clientSecret) { (authToken, requestCompleted, errorCode) in
                                                var resultText: String = ""
                                                if (requestCompleted) {
                                                    if (errorCode == FSOAuthErrorCode.none) {
                                                        resultText = String(format: "Auth Token: %@", authToken!)
                                                        SessionManager.shared.setToken(token: authToken!)
                                                    } else {
                                                        resultText = "\(errorCode)"
                                                    }
                                                } else {
                                                    resultText = "An error occured when attempting o connect to the Foursquare server."
                                                }
                                                print(resultText)
                                                
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        let character = (self.typeField.text?.count)!
        if character < 3 {
            let alert = UIAlertController(title: "Warning", message: "We need your entry more than three characters.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return false
        }
        return true
    }
    
    @objc func openList() {
        let vc = AppStoryboard.Main.view(controllerClass: VenuesViewController.self)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    override func updateViewConstraints() {
        if !didSetupConstraints {
            typeField.left(25).right(25).height(40).pinTo(view: nearField, bottom: -15)
            nearField.left(25).right(25).centeredOnY().height(40)
            searchButton.left(25).right(25).height(40).pinTo(view: nearField, top: 15)
            didSetupConstraints = true
            
        }
        super.updateViewConstraints()
    }
}

