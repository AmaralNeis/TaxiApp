//
//  Updatable.swift
//  TaxiApp
//
//  Created by dede.exe on 16/10/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

public protocol Updatable : class {
    func update(with info:[String:Any]?)
}
