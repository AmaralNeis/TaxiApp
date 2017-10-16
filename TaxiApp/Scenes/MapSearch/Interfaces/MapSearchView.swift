//
//  MapSearchView.swift
//  TaxiApp
//
//  Created by dede.exe on 15/10/17.
//Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit

public protocol MapSearchView : class {
    func show(addresses:[Address])
    func eraseSearch()
}
