//
//  VenuesCell.swift
//  Isengard
//
//  Created by Çağatay Eğilmez on 14.04.2019.
//  Copyright © 2019 Isengard. All rights reserved.
//

import UIKit
import Foundation
class VenuesCell: UITableViewCell {
    var titleLabel = UILabel()
    var addressLabel = UILabel()
    var countryLabel = UILabel()
    
    var didSetupConstraints = false
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.white
        
        titleLabel.textColor = .templateColor
        titleLabel.font = AppFont.regular.pt17
        self.contentView.addSubview(titleLabel)
        
        addressLabel.textColor = .black
        addressLabel.font = AppFont.regular.pt15
        addressLabel.numberOfLines = 0
        self.contentView.addSubview(addressLabel)
        
        countryLabel.textColor = UIColor.black.withAlphaComponent(0.5)
        countryLabel.font = AppFont.regular.pt13
        countryLabel.textAlignment = .right
        self.contentView.addSubview(countryLabel)
        
        self.contentView.setNeedsUpdateConstraints()
    }
    override func updateConstraints() {
        if(!didSetupConstraints){
            titleLabel.left(15).top(15).right(15).height(20)
            addressLabel.left(15).pinTo(view: titleLabel, top: 10).right(15).bottom(15)
            countryLabel.right(15).bottom(15).width(50).height(15)
            didSetupConstraints = true
        }
        super.updateConstraints()
    }
    func set(model: VenueListModel) {
        self.titleLabel.text = model.categories.name!
        self.addressLabel.text = model.location.address!
        self.countryLabel.text = model.location.country!
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
