//
//  VenuesViewController.swift
//  Isengard
//
//  Created by Çağatay Eğilmez on 14.04.2019.
//  Copyright © 2019 Isengard. All rights reserved.
//

import UIKit
import Foundation
import PullToRefresh

class VenuesViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var ll = ""
    var near = ""
    var venueList = [VenueListModel]()
    let refresher = PullToRefresh()
    
    var didSetupConstraints = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Places"
        self.getVenueList()
        
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = UIColor.black.withAlphaComponent(0.5)
        tableView.register(VenuesCell.classForCoder(), forCellReuseIdentifier: "VenuesCell")
        tableView.addPullToRefresh(refresher) {
            self.getVenueList()
        }
        
        self.view.setNeedsUpdateConstraints()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    override func updateViewConstraints() {
        if !didSetupConstraints {
            tableView.spread()
            didSetupConstraints = true
        }
        super.updateViewConstraints()
    }
}
extension VenuesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.venueList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VenuesCell", for: indexPath) as! VenuesCell
        cell.set(model: self.venueList[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
}

//MARK: Api Call
extension VenuesViewController {
    func getVenueList() {
        self.startLoader()
        VenueFactory.GetVenueList(ll: self.ll, near: self.near)
            .done { (result) in
                self.venueList = result
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
        }
            .catch { (error) in
                let error = error as! ApiError
                self.tableView.endAllRefreshing()
                self.showAlert(title: "Warning", message: error.handle.description)
        }
            .finally {
                self.tableView.endAllRefreshing()
                self.stopLoader()
        }
    }
}
