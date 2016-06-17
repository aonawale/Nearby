//
//  PlaceTypeCell.swift
//  NearBy
//
//  Created by Ahmed Onawale on 6/17/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

import UIKit

class PlaceCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
