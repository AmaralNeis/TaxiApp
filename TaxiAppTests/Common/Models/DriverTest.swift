//
//  DriverTest.swift
//  TaxiAppTests
//
//  Created by dede.exe on 16/10/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import XCTest
@testable import TaxiApp

class DriverTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCreateCoordinate() {
        let latitude    : Double = 54.321
        let longitude   : Double = 12.34567
        let driver      : Driver = Driver(driverName: "Lucio", driverCar: "Omega", latitude: 54.321, longitude: 12.34567, nearest: false)
        let coordinate = driver.coordinate
        
        XCTAssertTrue(coordinate is Coordinate)
        XCTAssertEqual(coordinate.latitude, latitude)
        XCTAssertEqual(coordinate.longitude, longitude)
    }

    func testCreateCoordinateWithNoData() {
        let latitude    : Double = 0.0
        let longitude   : Double = 0.0
        let driver      : Driver = Driver(driverName: "Lucio", driverCar: "Omega", latitude: nil, longitude: nil, nearest: false)
        let coordinate = driver.coordinate
        
        XCTAssertTrue(coordinate is Coordinate)
        XCTAssertEqual(coordinate.latitude, latitude)
        XCTAssertEqual(coordinate.longitude, longitude)
    }
    
}
