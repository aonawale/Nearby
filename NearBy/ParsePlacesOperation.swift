//
//  ParsePlacesOperation.swift
//  NearBy
//
//  Created by Ahmed Onawale on 6/16/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

import Foundation
import RxSwift

/// An `Operation` to parse places out of a downloaded json from the Google.
class ParsePlacesOperation: Operation {
    
    let cacheFile: NSURL
    var places = Variable<[Place]>([])
    
    /**
     - parameter cacheFile: The file `NSURL` from which to load earthquake data.
     */
    init(cacheFile: NSURL) {
        self.cacheFile = cacheFile
        super.init()
        name = "Parse Places"
    }
    
    override func execute() {
        guard let stream = NSInputStream(URL: cacheFile) else {
            finish()
            return
        }
        
        stream.open()
        
        defer {
            stream.close()
        }
        
        do {
            let json = try NSJSONSerialization.JSONObjectWithStream(stream, options: []) as? [String: AnyObject]
            guard let results = json?["results"] as? [AnyObject] else {
                return finish()
            }
            parse(results)
        } catch let jsonError as NSError {
            finishWithError(jsonError)
        }
    }
    
    private func parse(results: [AnyObject]) {
        places.value = Place.from(results)!
    }
    
}