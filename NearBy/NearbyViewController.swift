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
        setupRx()
    }
    
    private func setupRx() {
        tableView
            .rx_itemSelected
            .subscribeNext { indexPath in
                let svc = UIStoryboard.searchViewController
                let placeType = PlaceType.all()[indexPath.row]
                let c = CLLocationCoordinate2D(latitude: 6.5243793, longitude: 3.3792057)
                svc.viewModel = SearchViewModel(placeType: placeType, coordinate: c)
                self.navigationController?.pushViewController(svc, animated: true)
            }
            .addDisposableTo(disposeBag)
    }

}
