//
//  Coordinates.swift
//  TaxiApp
//
//  Created by dede.exe on 14/10/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation
import CoreLocation

public struct Coordinate : Mappable {
    public let latitude    : Double
    public let longitude   : Double
    
    var location : CLLocation {
        let location = CLLocation(latitude: self.latitude, longitude:self.longitude )
        return location
    }
    
    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
    }
    
    public init(latitude:Double, longitude:Double) {
        self.latitude   = latitude
        self.longitude  = longitude
    }
    
    public init(coordinate:CLLocationCoordinate2D) {
        self.latitude   = coordinate.latitude
        self.longitude  = coordinate.longitude
    }

}

