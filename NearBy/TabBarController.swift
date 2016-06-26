//
//  TabbarController.swift
//  NearBy
//
//  Created by Ahmed Onawale on 6/20/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

import Foundation
import UIKit

extension UITabBarController {
    
    var searchViewController: SearchViewController? {
        return self.viewControllers?[1].contentViewController as? SearchViewController
    }
    
}