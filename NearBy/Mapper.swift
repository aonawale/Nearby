//
//  Mapper.swift
//  NearBy
//
//  Created by Ahmed Onawale on 6/16/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

import Foundation
import CoreLocation
import Mapper

extension CLLocationCoordinate2D: Convertible {
    public static func fromMap(value: AnyObject?) throws -> CLLocationCoordinate2D {
        guard let geometry = value as? [String: AnyObject],
            let location = geometry["location"] as? [String: AnyObject],
            let latitude = location["lat"] as? Double,
            let longitude = location["lng"] as? Double else
        {
            throw MapperError.ConvertibleError(value: value, type: [String: Double].self)
        }
        
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
