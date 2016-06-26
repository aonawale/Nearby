//
//  Photo.swift
//  NearBy
//
//  Created by Ahmed Onawale on 6/16/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

import Foundation
import Mapper
import UIKit

enum PhotoState {
    case New, Downloaded, Failed
}

final class Photo: Mappable {
    
    let height: Int
    let width: Int
    let reference: String
    var image: UIImage?
    var state = PhotoState.New
    
    required init(map: Mapper) throws {
        try height = map.from("height")
        try width = map.from("width")
        try reference = map.from("photo_reference")
    }
    
}