//
//  SearchViewModel.swift
//  NearBy
//
//  Created by Ahmed Onawale on 6/14/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

import Foundation
import RxSwift
import CoreLocation

class SearchViewModel {
    
    private(set) var places: Observable<[Place]>!
    private let queue = OperationQueue()
    private let placeType: PlaceType
    private let coordinate: CLLocationCoordinate2D
    
    init(placeType: PlaceType, coordinate: CLLocationCoordinate2D) {
        self.placeType = placeType
        self.coordinate = coordinate
    }
    
    func getPlaces() -> Observable<[Place]> {
        let op = GetPlacesOperation(placeType: placeType, coordinate: coordinate, radius: 500)
        queue.addOperation(op)
        places = op.places
        return op.places
    }
    
}