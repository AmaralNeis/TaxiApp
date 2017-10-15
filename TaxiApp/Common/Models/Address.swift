//
//  Address.swift
//  TaxiApp
//
//  Created by dede.exe on 15/10/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation
import CoreLocation

public struct Address : Mappable {
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
}
