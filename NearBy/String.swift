//
//  String.swift
//  NearBy
//
//  Created by Ahmed Onawale on 6/16/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

import Foundation

extension String {
    
    var underscored: String {
        return lowercaseString.stringByReplacingOccurrencesOfString(" ", withString: "_")
    }
    
}