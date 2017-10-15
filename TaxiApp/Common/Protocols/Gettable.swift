//
//  Gettable.swift
//  TaxiApp
//
//  Created by dede.exe on 15/10/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

public protocol Gettable {
    associatedtype DataType
    func get(completion: @escaping (RequestResult<DataType>, [String:Any]) -> Void)
}
