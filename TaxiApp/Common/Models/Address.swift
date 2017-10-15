//
//  Address.swift
//  TaxiApp
//
//  Created by dede.exe on 15/10/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation
import GoogleMaps

public struct Address : Mappable {
    var street      : String?
    var coordinate  : Coordinate?
    
    public init() {}
    
//    enum CodingKeys : String, CodingKey {
//        case driverName     = "driver-name"
//        case driverCar      = "driver-car"
//        case latitude       = "lat"
//        case longitude      = "lng"
//    }
}

extension Address {
    public init(googleAddress:GMSAddress) {
       // self.street
    }
}
