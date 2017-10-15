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
    func showAddress(_ address:Address?)
    func updateMapLocation(coordinate:Coordinate, zoom:Double)
    func showMarker(device coordinate:Coordinate)
    func showMarker(location coordinate:Coordinate)
    func showMarkers(drivers: [Driver])
}
