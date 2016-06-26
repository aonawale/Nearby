//
//  DownloadPhotoOperation.swift
//  NearBy
//
//  Created by Ahmed Onawale on 6/18/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

import Foundation
import UIKit

class DownloadPhotoOperation: Operation {
    // MARK: Properties
    
    typealias handler = (operation: DownloadPhotoOperation, photo: Photo) -> Void
    private var completionHandler: handler
    private var photo: Photo
    private let key = "AIzaSyAhW8_ChiSz8rpSZJ8uDEl3xjytmWaRCQI"
    private let host = "https://maps.googleapis.com/maps/api/place/photo"
    
    // MARK: Initialization
    
    /// - parameter cacheFile: The file `NSURL` to which the earthquake feed will be downloaded.
    init(photo: Photo, completionHandler: handler) {
        self.photo = photo
        self.completionHandler = completionHandler
        super.init()
        name = "Download Places"
    }
    
    override func execute() {
        let url = NSURLComponents(string: host)!
        url.queryItems = query
        
        let imageData = NSData(contentsOfURL: url.URL!)
        
        if cancelled { return }
        
        if imageData?.length > 0 {
            photo.image = UIImage(data: imageData!)
            photo.state = .Downloaded
        } else {
            photo.state = .Failed
            photo.image = UIImage(named: "Failed")
        }
        completionHandler(operation: self, photo: photo)
    }
    
    private var query: [NSURLQueryItem] {
        let reference = NSURLQueryItem(name: "photoreference", value: self.photo.reference)
        let maxWidth = NSURLQueryItem(name: "maxwidth", value: "1000")
        let key = NSURLQueryItem(name: "key", value: "\(self.key)")
        return [reference, maxWidth, key]
    }
    
}