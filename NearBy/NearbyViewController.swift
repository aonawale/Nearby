//
//  NearbyViewController.swift
//  NearBy
//
//  Created by Ahmed Onawale on 6/11/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import MedKit
import CoreLocation

class NearbyViewController: UITableViewController, SegueIdentifiable {
    
    private var viewModel: NearbyViewModel!
    private var dataSource: NearbyTableDataSource!
    private let disposeBag = DisposeBag()
    
    enum SegueIdentifier: String {
        case ShowPlaceType
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = NearbyViewModel()
        dataSource = NearbyTableDataSource(PlaceType.all(), listView: tableView)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let segueIdentifier = segueIdentifierForSegue(segue) else { return }
        switch segueIdentifier {
        case .ShowPlaceType:
            let placeType = PlaceType.all()[tableView.indexPathForSelectedRow!.row]
            let pvc = segue.destinationViewController.contentViewController as! PlacesViewController
            pvc.viewModel = PlacesViewModel(placeType: placeType)
        }
    }

}
