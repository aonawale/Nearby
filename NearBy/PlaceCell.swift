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
    
    func configureWithPlace(place: Place) {
        nameLabel.text = place.name
        addressLabel.text = place.address
        ratingLabel.text = "\(place.rating)"
        let imageView = UIImageView(image: place.photos.first?.image)
        imageView.contentMode = .ScaleAspectFit
        backgroundView = imageView
    }

}
