//
//  GetPlacesOperation.swift
//  NearBy
//
//  Created by Ahmed Onawale on 6/16/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

/*
Abstract:
This file sets up the operations to download and parse places data. It will also decide to display an error message, if appropriate.
*/

import Foundation
import CoreLocation
import RxSwift

/// A composite `Operation` to both download and parse places data.
class GetPlacesOperation: GroupOperation {
    // MARK: Properties
    
    lazy var places: Observable<[Place]> = {
        return self.parseOperation.places.asObservable().observeOn(MainScheduler.instance)
    }()
    private let downloadOperation: DownloadPlacesOperation
    private let parseOperation: ParsePlacesOperation
    /**
         - parameter completionHandler: The handler to call after downloading and
         parsing are complete. This handler will be
         invoked on an arbitrary queue.
     */
    init(placeType: PlaceType, coordinate: CLLocationCoordinate2D, radius: Int = 100, completionHandler: (Void -> Void) = {}) {
        let cachesFolder = try! NSFileManager.defaultManager().URLForDirectory(.CachesDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
        
        let cacheFileURL = cachesFolder.URLByAppendingPathComponent("places.json")
        
        /*
         This operation is made of three child operations:
         1. The operation to download the JSON places
         2. The operation to parse the JSON and create Place objects from
         3. The operation to invoke the completion handler
         */
        downloadOperation = DownloadPlacesOperation(cacheFileURL: cacheFileURL, placeType: placeType, coordinate: coordinate, radius: radius)
        parseOperation = ParsePlacesOperation(cacheFile: cacheFileURL)
        
        let finishOperation = NSBlockOperation(block: completionHandler)
        
        // These operations must be executed in order
        parseOperation.addDependency(downloadOperation)
        finishOperation.addDependency(parseOperation)
        
        super.init(operations: [downloadOperation, parseOperation, finishOperation])

        name = "Get Places"
    }
    
}

// Operators to use in the switch statement.
private func ~=(lhs: (String, Int, String?), rhs: (String, Int, String?)) -> Bool {
    return lhs.0 ~= rhs.0 && lhs.1 ~= rhs.1 && lhs.2 == rhs.2
}

private func ~=(lhs: (String, OperationErrorCode, String), rhs: (String, Int, String?)) -> Bool {
    return lhs.0 ~= rhs.0 && lhs.1.rawValue ~= rhs.1 && lhs.2 == rhs.2
}