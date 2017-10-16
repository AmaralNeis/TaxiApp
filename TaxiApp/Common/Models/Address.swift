//
//  Address.swift
//  TaxiApp
//
//  Created by dede.exe on 15/10/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation
import CoreLocation
import GooglePlaces

public struct Address : Mappable {
    var id          : String?
    var street      : String?
    var region      : String?
    var city        : String?
    var province    : String?
    var coordinate  : Coordinate?
    
    public init() {}
    
}

extension Address {
    public init(placemark:CLPlacemark) {
        self.street     = placemark.name
        self.region     = placemark.subLocality
        self.city       = placemark.subLocality
        self.province   = placemark.locality
    }
    
    public init(prediction: GMSAutocompletePrediction) {
        self.id         = prediction.placeID
        self.street     = prediction.attributedPrimaryText.string
        self.city       = prediction.attributedSecondaryText?.string
    }
    
    public init(gmsPlace:GMSPlace) {
        self.id = gmsPlace.placeID
        self.street = gmsPlace.name
        self.coordinate = Coordinate(coordinate: gmsPlace.coordinate)
    }
}
