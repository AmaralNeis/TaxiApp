//
//  PlaceFilterService.swift
//  TaxiApp
//
//  Created by dede.exe on 16/10/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation
import GooglePlaces

public struct PlaceFilterService : Gettable {
    
    public typealias DataType = [Address]
    
    public let name : String
    
    public init(place name:String) {
        self.name = name
    }
    
    public func get(completion: @escaping (RequestResult<DataType>, [String:Any]) -> Void) {
        let placesClient = GMSPlacesClient()
        let filter = GMSAutocompleteFilter()
        filter.type = .region
        
        placesClient.autocompleteQuery(name, bounds: nil, filter: filter) { places, error in
            if let error = error {
                let err = error as NSError
                let result = RequestResult<DataType>.fail(err.code, err)
                completion(result, [:])
                return
            }
            
            if let places = places {
                var addresses = [Address]()
                for place in places {
                    let address = Address(prediction: place)
                    addresses.append(address)
                }
                
                completion(RequestResult<DataType>.success(200, addresses), [:])
                return
            }
            
            completion(RequestResult<DataType>.success(200, []), [:])
        }
    }
}
