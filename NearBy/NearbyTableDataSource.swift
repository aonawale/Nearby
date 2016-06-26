//
//  NearbyTableDataSource.swift
//  NearBy
//
//  Created by Ahmed Onawale on 6/15/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

import Foundation
import MedKit
import RxSwift

class NearbyTableDataSource: TableDataSource<PlaceType, UITableView> {
    
    private let reuseIdentifier = "PlaceTypeCell"
    
    required init(_ elements: [[Element]], listView: ListView) {
        super.init(elements, listView: listView)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath)
        cell.textLabel?.text = self[indexPath]?.rawValue
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
}