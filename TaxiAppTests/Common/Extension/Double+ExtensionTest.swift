//
//  Double+ExtensionTest.swift
//  TaxiAppTests
//
//  Created by dede.exe on 16/10/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import XCTest
@testable import TaxiApp

class Double_ExtensionTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDoubleAbsolute() {
        XCTAssertEqual(Double(-10.0).absolute, 10.0)
        XCTAssertEqual(Double(10.0).absolute, 10.0)
        XCTAssertEqual(Double(0.0).absolute, 0.0)
    }

}
