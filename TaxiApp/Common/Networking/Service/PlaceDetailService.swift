//
//  PlaceDetailService.swift
//  TaxiApp
//
//  Created by dede.exe on 16/10/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation
import GooglePlaces

public struct PlaceDetailService : Gettable {
    
    public typealias DataType = Address
    public let id : String
    
    public init(place id:String) {
        self.id = id
    }
    
    public func get(completion: @escaping (RequestResult<DataType>, [String:Any]) -> Void) {
        let placesClient = GMSPlacesClient()
        
        placesClient.lookUpPlaceID(id) { (place, error) in
            if let error = error {
                let err = error as NSError
                let result = RequestResult<DataType>.fail(err.code, err)
                completion(result, [:])
                return
            }
            
            if let place = place {
                let address = Address(gmsPlace: place)
                completion(RequestResult<DataType>.success(HttpStatusCode.ok.rawValue, address), [:])
                return
            }
            
            let error = NSError(domain: "Address detail not found", code: HttpStatusCode.notFound.rawValue, userInfo:nil)
            completion(RequestResult<DataType>.fail(HttpStatusCode.notFound.rawValue, error), [:])
        }
    }
}
