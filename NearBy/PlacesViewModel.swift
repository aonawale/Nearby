//
//  PlaceTypeViewModel.swift
//  NearBy
//
//  Created by Ahmed Onawale on 6/16/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

import Foundation
import RxSwift
import CoreLocation

class PlacesViewModel {
    
    private let queue = OperationQueue()
    private let placeType: PlaceType
    private let disposeBag = DisposeBag()
    
    init(placeType: PlaceType) {
        self.placeType = placeType
        let c = CLLocationCoordinate2D(latitude: 6.5243793, longitude: 3.3792057)
        let op = GetPlacesOperation(placeType: placeType, coordinate: c, radius: 500)
        queue.addOperation(op)
        op.places
            .subscribeNext { places in
                print(places.map {$0.name} )
            }
            .addDisposableTo(disposeBag)
    }
    
}