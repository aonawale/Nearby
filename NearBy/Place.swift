//
//  Place.swift
//  NearBy
//
//  Created by Ahmed Onawale on 6/16/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

import Foundation
import CoreLocation
import Mapper

struct Place: Mappable {
    
    let id: String
    let name: String
    let placeId: String
    let rating: Double
    let address: String
    let location: CLLocationCoordinate2D
    let types: [String]
    let currentlyOpen: Bool
    var photos: [Photo]
    
    init(map: Mapper) throws {
        try id = map.from("id")
        try name = map.from("name")
        try placeId = map.from("place_id")
        rating = map.optionalFrom("rating") ?? 0
        try address = map.from("vicinity")
        try location = map.from("geometry")
        try types = map.from("types")
        currentlyOpen = map.optionalFrom("opening_hours.open_now") ?? false
        photos = map.optionalFrom("photos") ?? []
    }
    
}