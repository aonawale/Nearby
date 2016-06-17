//
//  PlaceTypeViewController.swift
//  NearBy
//
//  Created by Ahmed Onawale on 6/16/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PlacesViewController: UITableViewController {
    
    var viewModel: PlacesViewModel!
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(viewModel: PlacesViewModel, style: UITableViewStyle = .Plain) {
        self.viewModel = viewModel
        super.init(style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
