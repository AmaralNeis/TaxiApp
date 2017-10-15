//
//  RequestEncoding.swift
//  TaxiApp
//
//  Created by dede.exe on 14/10/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//


import Foundation

public enum RequestEncoding : String {
    case url
    case json
    case httpBody
}

extension RequestEncoding {
    var contentType : String {
        switch self {
            case .json              : return "application/json"
            case .url, .httpBody    : return ""
        }
    }
}
