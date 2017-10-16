//
//  ReverseGeolocationService.swift
//  TaxiApp
//
//  Created by dede.exe on 15/10/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation
import CoreLocation

public struct ReverseGeolocationService : Gettable {
    
    public typealias DataType = Address?
    
    public let longitude    : Double
    public let latitude     : Double
    public let geocoder     : CLGeocoder
    
    public init(longitude:Double, latitude:Double) {
        self.longitude  = longitude
        self.latitude   = latitude
        geocoder        = CLGeocoder()
    }
    
    public func get(completion: @escaping (RequestResult<DataType>, [String:Any]) -> Void) {
        let location = CLLocation(latitude: latitude, longitude: longitude)
        
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let error = error {
                let err = error as NSError
                let result = RequestResult<DataType>.fail(err.code, err)
                completion(result, [:])
                return
            }
            
            if let placemark = placemarks?.first {
                let address = Address(placemark: placemark)
                completion(RequestResult<DataType>.success(HttpStatusCode.ok.rawValue, address), [:])
                return
            }
            
            completion(RequestResult<DataType>.success(HttpStatusCode.ok.rawValue, nil), [:])
        }
    }
}
