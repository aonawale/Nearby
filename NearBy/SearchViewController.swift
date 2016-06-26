//
//  SearchViewController.swift
//  NearBy
//
//  Created by Ahmed Onawale on 6/14/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import CoreLocation

class SearchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var seachViewHeight: NSLayoutConstraint!
    
    var viewModel: SearchViewModel!
    private var dataSource: SearchDataSource!
    
    let typeSearchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seachViewHeight.constant = 0.0
        tableView.rowHeight = 100
        navigationItem.titleView = typeSearchBar
        typeSearchBar.delegate = self
        if let model = viewModel {
            dataSource = SearchDataSource(places: model.getPlaces(), tableView: tableView)
        }
        setupRx()
    }
    
    func setupRx() {}

}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        seachViewHeight.constant = 0.0
        typeSearchBar.resignFirstResponder()
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        seachViewHeight.constant = 46.0
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
                self.searchBarView.layoutIfNeeded()
            }, completion: nil)
    }
    
}
