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
    public func getAddress(at coordinate: Coordinate) {
        let service = ReverseGeolocationService(longitude: coordinate.longitude, latitude: coordinate.longitude)
        service.get { [weak self] (result, _) in
            switch(result) {
                case .success(_, let address):
                    self?.output?.fetchAddres(address)
                case .fail:
                    break
            }
        }
    }
    
    public func getDrivers(at coordinate: Coordinate) {
        let service = DriversService(longitude: coordinate.longitude, latitude: coordinate.latitude)
        service.get { [weak self] (result, _) in
            switch(result) {
                case .success(_, let drivers):
                    self?.output?.fetchDrivers(drivers.taxis)
                case .fail:
                    break
            }
        }
    }
    
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

// MARK: - Helpers
extension MapPageInputInteractor {
    func handleResult(drivers:[Driver]) {
        output?.fetchDrivers(drivers)
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
