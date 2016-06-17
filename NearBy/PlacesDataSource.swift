//
//  PlaceTypeDataSource.swift
//  NearBy
//
//  Created by Ahmed Onawale on 6/16/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

import Foundation
import MedKit

class PlacesDataSource: TableDataSource<Place, UITableView> {
    
    let reuseIdentifier = "PlaceCell"
    
    required init(_ elements: [[Element]], listView: ListView) {
        super.init(elements, listView: listView)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as! PlaceCell
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
}