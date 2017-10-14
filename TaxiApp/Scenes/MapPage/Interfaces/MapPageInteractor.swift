//
//  MapPageInteractor.swift
//  TaxiApp
//
//  Created by dede.exe on 14/10/17.
//Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

public protocol MapPageInput : class {
    func get(something:String)
}

public protocol MapPageOutput : class {
    func fetch(something:String)
}
