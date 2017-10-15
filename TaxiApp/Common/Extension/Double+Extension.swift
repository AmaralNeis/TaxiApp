//
//  Double+Extension.swift
//  TaxiApp
//
//  Created by dede.exe on 15/10/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

extension Double {
    var absolute:Double {
        var value = self
        if value < 0 {
            value = -(value)
        }
        
        return value
    }
}
