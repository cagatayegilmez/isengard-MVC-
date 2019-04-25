//
//  UIViewController.swift
//  Isengard
//
//  Created by Çağatay Eğilmez on 17.04.2019.
//  Copyright © 2019 Isengard. All rights reserved.
//

import Foundation
import NVActivityIndicatorView

extension UIViewController: NVActivityIndicatorViewable {
    @discardableResult public func showAlert(title: String?, message: String?, buttonTitles: [String]? = nil, highlightedButtonIndex: Int? = nil, completion: ((Int) -> Void)? = nil) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        var allButtons = buttonTitles ?? [String]()
        if allButtons.count == 0 {
            allButtons.append("OK")
        }
        
        for index in 0..<allButtons.count {
            let buttonTitle = allButtons[index]
            let action = UIAlertAction(title: buttonTitle, style: .default, handler: { (_) in
                completion?(index)
            })
            alertController.addAction(action)
            // Check which button to highlight
            if let highlightedButtonIndex = highlightedButtonIndex, index == highlightedButtonIndex {
                if #available(iOS 9.0, *) {
                    alertController.preferredAction = action
                }
            }
        }
        present(alertController, animated: true, completion: nil)
        return alertController
    }
    func startLoader() {
        startAnimating(CGSize(width: 50, height: 50), message: nil, messageFont: nil, type: .ballSpinFadeLoader, color: .white, padding: nil, displayTimeThreshold: nil, minimumDisplayTime: nil, backgroundColor: UIColor.black.withAlphaComponent(0.4), textColor: nil)
    }
    
    func stopLoader() {
        stopAnimating()
    }
}
