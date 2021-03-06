//
//  MapSearchModule
//  TaxiApp
//
//  Created by dede.exe on 15/10/17.
//Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

public protocol MapSearchModule : class {
    func search(address:String?)
    func searchDetail(of address:Address)
    func backToMap()
    func resetSearch()
}
