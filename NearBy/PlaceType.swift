//
//  PlaceType.swift
//  NearBy
//
//  Created by Ahmed Onawale on 6/14/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

import Foundation

enum PlaceType: String {
    case Hospital
    case Laundry
    case ATM
    case Library
    case Bank
    case Bar
    case BeautySalon = "Beauty Salon"
    case Lodging
    case Cafe
    case NightClub = "Night Club"
    case Park
    case Restaurant
    case School
    case ShoppingMall = "Shopping Mall"
    case GasStation = "Gas Station"
    case BusStation = "Bus Station"
    
    static func all() -> [PlaceType] {
        return [.Hospital, .Laundry, .ATM, .Library,
                .Bank, .Bar, .BeautySalon, .Lodging, .Cafe,
                .NightClub, .Park, .Restaurant, .School, .ShoppingMall,
                .GasStation, .BusStation]
    }
}