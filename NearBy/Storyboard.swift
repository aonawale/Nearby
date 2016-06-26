//
//  Storyboard.swift
//  NearBy
//
//  Created by Ahmed Onawale on 6/23/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

import Foundation
import UIKit

protocol StoryboardInstantiable {
    associatedtype StoryboardId: RawRepresentable
}

extension StoryboardInstantiable where StoryboardId.RawValue == String {
    
}

extension UIStoryboard {
    
    class var searchViewController: SearchViewController {
        return search.instantiateViewControllerWithIdentifier("SearchViewController") as! SearchViewController
    }
    
    class var search: UIStoryboard {
        return UIStoryboard(name: "Search", bundle: NSBundle.mainBundle())
    }
    
    class var nearby: UIStoryboard {
        return UIStoryboard(name: "Nearby", bundle: NSBundle.mainBundle())
    }
    
}