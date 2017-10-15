//
//  MapPageView.swift
//  TaxiApp
//
//  Created by dede.exe on 14/10/17.
//Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit

public protocol MapPageView : class {
    func plotNewMap(coordinate:Coordinate, zoom:Double)
    func updateMapLocation(coordinate:Coordinate, zoom:Double)
    func setPin(device coordinate:Coordinate)
    func setPin(location coordinate:Coordinate)
    func setPins(drivers: [Driver])
}
