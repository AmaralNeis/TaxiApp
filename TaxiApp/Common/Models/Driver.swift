//
//  Driver.swift
//  TaxiApp
//
//  Created by dede.exe on 14/10/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

public struct Driver : Mappable {
    var driverName  : String?
    var driverCar   : String?
    var latitude    : Double?
    var longitude   : Double?

    enum CodingKeys : String, CodingKey {
        case driverName     = "driver-name"
        case driverCar      = "driver-car"
        case latitude       = "lat"
        case longitude      = "lng"
    }
}
