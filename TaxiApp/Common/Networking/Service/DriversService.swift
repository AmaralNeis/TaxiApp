//
//  DriversService.swift
//  TaxiApp
//
//  Created by dede.exe on 15/10/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

public struct DriversService : Gettable {
    
    public typealias DataType = Driver
    
    public let longitude    : Double
    public let latitude     : Double
    
    public init(longitude:Double, latitude:Double) {
        self.longitude  = longitude
        self.latitude   = latitude
    }
    
    public func get(completion: @escaping (RequestResult<DataType>, [String:Any]) -> Void) {
        let requestInfo = DriversEndpoint.getDriversAt(latitude: latitude, longitude: longitude)
        
        _ = WebService.instance.request(request: requestInfo) { result, headers in
            switch result {
                case .fail(let code, let err):
                    completion(RequestResult<DataType>.fail(code, err), headers)
                
                case .success(let code, let json):
                    let user = Driver(jsonString: json ?? "") ?? Driver()
                    completion(RequestResult<DataType>.success(code, user), headers)
            }
        }
    }
}
