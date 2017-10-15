//
//  RequestResult.swift
//  TaxiApp
//
//  Created by dede.exe on 14/10/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//
import Foundation

public enum RequestResult<T> {
    case success(Int, T)
    case fail(Int, Error)
}
