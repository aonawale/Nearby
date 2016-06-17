//
//  PlaceTypeOperation.swift
//  NearBy
//
//  Created by Ahmed Onawale on 6/16/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

import Foundation
import CoreLocation

class DownloadPlacesOperation: GroupOperation {
    // MARK: Properties
    
    private let cacheFileURL: NSURL
    private let radius: Int
    private let coordinate: CLLocationCoordinate2D
    private let placeType: PlaceType
    private let key = "AIzaSyAhW8_ChiSz8rpSZJ8uDEl3xjytmWaRCQI"
    private let host = "https://maps.googleapis.com/maps/api/place/nearbysearch/json"
    
    // MARK: Initialization
    
    /// - parameter cacheFile: The file `NSURL` to which the earthquake feed will be downloaded.
    init(cacheFileURL: NSURL, placeType: PlaceType, coordinate: CLLocationCoordinate2D, radius: Int) {
        self.cacheFileURL = cacheFileURL
        self.placeType = placeType
        self.coordinate = coordinate
        self.radius = radius
        super.init(operations: [])
        name = "Download Places"
        
        let url = NSURLComponents(string: host)!
        url.queryItems = query
        let task = NSURLSession.sharedSession().downloadTaskWithURL(url.URL!) { url, response, error in
            self.downloadFinished(url, response: response as? NSHTTPURLResponse, error: error)
        }
        
        let taskOperation = URLSessionTaskOperation(task: task)
        
        let reachabilityCondition = ReachabilityCondition(host: url.URL!)
        taskOperation.addCondition(reachabilityCondition)
        
//        let networkObserver = NetworkObserver()
//        taskOperation.addObserver(networkObserver)
        
        addOperation(taskOperation)
    }
    
    private var query: [NSURLQueryItem] {
        let location = NSURLQueryItem(name: "location", value: "\(coordinate.latitude),\(coordinate.longitude)")
        let type = NSURLQueryItem(name: "type", value: placeType.rawValue.underscored)
        let radius = NSURLQueryItem(name: "radius", value: "\(self.radius)")
        let key = NSURLQueryItem(name: "key", value: "\(self.key)")
        return [location, type, radius, key]
    }
    
    func downloadFinished(url: NSURL?, response: NSHTTPURLResponse?, error: NSError?) {
        if let localURL = url {
            do {
                /*
                 If we already have a file at this location, just delete it.
                 Also, swallow the error, because we don't really care about it.
                 */
                try NSFileManager.defaultManager().removeItemAtURL(cacheFileURL)
            } catch { }
            
            do {
                try NSFileManager.defaultManager().moveItemAtURL(localURL, toURL: cacheFileURL)
            } catch let error as NSError {
                aggregateError(error)
            }
        } else if let error = error {
            aggregateError(error)
        } else {
            // Do nothing, and the operation will automatically finish.
        }
    }
    
}