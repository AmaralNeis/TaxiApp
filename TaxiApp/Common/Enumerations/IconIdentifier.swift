//
//  IconIdentifier.swift
//  TaxiApp
//
//  Created by dede.exe on 15/10/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit

public enum IconIdentifier : String {
    case target         = "target"
    case marker         = "marker"
    case search         = "search"
    case place          = "place"
    case chevronLeft    = "chevronleft"
    case close          = "close"
}

extension IconIdentifier {
    var image : UIImage? {
        return UIImage(named: self.rawValue)
    }
}
