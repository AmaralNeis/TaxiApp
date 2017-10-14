//
//  MapPageModule
//  TaxiApp
//
//  Created by dede.exe on 14/10/17.
//Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

public protocol MapPageModule : class {
    var followUser : Bool { get set }
    func start()
}
