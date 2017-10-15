//
//  ReverseGeolocationService.swift
//  TaxiApp
//
//  Created by dede.exe on 15/10/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation
import GoogleMaps

public struct ReverseGeolocationService : Gettable {
    
    public typealias DataType = Address?
    
    public let longitude    : Double
    public let latitude     : Double
    public let geocoder     : GMSGeocoder
    
    public init(longitude:Double, latitude:Double) {
        self.longitude  = longitude
        self.latitude   = latitude
        geocoder        = GMSGeocoder()
    }
    
    public func get(completion: @escaping (RequestResult<DataType>, [String:Any]) -> Void) {
        let position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        geocoder.reverseGeocodeCoordinate(position) { (response, error) in
            if let error = error {
                let err = error as NSError
                let result = RequestResult<DataType>.fail(err.code, err)
                completion(result, [:])
                return
            }
            
            if let gmsAddress = response?.firstResult() {
                let address = Address(googleAddress: gmsAddress)
                completion(RequestResult<DataType>.success(200, address), [:])
                return
            }

            completion(RequestResult<DataType>.success(200, nil), [:])
        }
    }
}
