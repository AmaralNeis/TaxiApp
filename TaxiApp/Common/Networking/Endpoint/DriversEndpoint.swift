//
//  DriversEndpoint.swift
//  TaxiApp
//
//  Created by dede.exe on 15/10/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

enum DriversEndpoint {
    case getDriversAt(latitude:Double, longitude:Double)
}

extension DriversEndpoint : Endpoint {
    
    var baseURL: String {
        return AppConfig.apiURL
    }
    
    var path: String {
        return "/gettaxis"
    }
    
    var method: RequestMethod {
        return .get
    }
    
    var parameters: [String : Any] {
        switch self {
            case .getDriversAt(let latitude, let longitude): return ["lng":longitude, "lat":latitude]
        }
    }
    
    var headers: [String : String] {
        return ["Content-Type":"application/json"]
    }
    
    var encoding: RequestEncoding {
        switch self {
            case .getDriversAt:           return .url
        }
    }
    
    var body: Data? {
        switch self {
            case .getDriversAt:               return nil
        }
    }
}
