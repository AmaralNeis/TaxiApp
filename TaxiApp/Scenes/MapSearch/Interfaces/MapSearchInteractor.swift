//
//  MapSearchInteractor.swift
//  TaxiApp
//
//  Created by dede.exe on 15/10/17.
//Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

public protocol MapSearchInput : class {
    func search(address:String)
}

public protocol MapSearchOutput : class {
    func fetch(addressess:[Address])
}
