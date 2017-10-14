//
//  MapPageInputInteractor.swift
//  TaxiApp
//
//  Created by dede.exe on 14/10/17.
//Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation
import CoreLocation

public class MapPageInputInteractor : NSObject {
    
    private(set) public weak var output     : MapPageOutput?
    
    private(set) public var locationManager = CLLocationManager()
    
    public func inject(output:MapPageOutput?) {
        self.output = output
    }

    private func assertDependencies() {
   		assert(output != nil, "Did not set output to the input interactor")
    }
}

extension MapPageInputInteractor : MapPageInput {
    public func startLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.requestLocation()
            locationManager.startUpdatingLocation()
        }
    }
    
    public func stopLocation() {
        locationManager.stopUpdatingLocation()
    }
}

// MARK: - Location Manager Delegate
extension MapPageInputInteractor : CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last {
            let coordinate = Coordinate(coordinate: lastLocation.coordinate)
            output?.fetchUserLocation(coordinate: coordinate)
        }
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Falha")
    }
}
