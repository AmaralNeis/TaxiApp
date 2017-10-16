//
//  TableView+Utils.swift
//  TaxiApp
//
//  Created by dede.exe on 16/10/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit

extension UITableView {
    
    func registerCell(named identifier: String) {
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: identifier)
    }
    
}
