//
//  PlaceTypeDataSource.swift
//  NearBy
//
//  Created by Ahmed Onawale on 6/16/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

import Foundation
import MedKit
import RxSwift

class SearchDataSource {
    
    private let reuseIdentifier = "PlaceCell"
    private var places: Observable<[Place]>
    private let tableView: UITableView
    private let disposeBag = DisposeBag()
    private let queue = OperationQueue()
    
    var downloadsInProgress = [Int: NSOperation]()
    
    init(places: Observable<[Place]>, tableView: UITableView) {
        self.places = places
        self.tableView = tableView
        setupRx()
    }
    
    private func setupRx() {
        places
            .bindTo(tableView.rx_itemsWithCellIdentifier(reuseIdentifier, cellType: PlaceCell.self)) { [unowned self] row, element, cell in
                cell.configureWithPlace(element)
                guard let firstPhoto = element.photos.first else {
                    return
                }
                if firstPhoto.state == .New {
                    self.downloadPhotoForPlace(element, forRow: row)
                }
            }
            .addDisposableTo(disposeBag)
    }
    
    func downloadPhotoForPlace(place: Place, forRow row: Int) {
        if let _ = downloadsInProgress[row] { return }
        guard let photo = place.photos.first else { return }
        let operation = DownloadPhotoOperation(photo: photo) { operation, photo in
            if operation.cancelled { return }
            dispatch_async(dispatch_get_main_queue()) {
                let indexPath = NSIndexPath(forRow: row, inSection: 0)
                self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
                self.downloadsInProgress.removeValueForKey(row)
            }
        }
        downloadsInProgress[row] = operation
        queue.addOperation(operation)
    }
    
}