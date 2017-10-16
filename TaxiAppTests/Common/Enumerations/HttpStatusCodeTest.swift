//
//  HttpStatusCodeTest.swift
//  TaxiAppTests
//
//  Created by dede.exe on 16/10/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import XCTest
@testable import TaxiApp

class HttpStatusCodeTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSuccess() {
        XCTAssertTrue(HttpStatusCode.ok.isSuccess())
        XCTAssertTrue(HttpStatusCode.created.isSuccess())
        XCTAssertTrue(HttpStatusCode.accepted.isSuccess())
        XCTAssertTrue(HttpStatusCode.noContent.isSuccess())
        XCTAssertTrue(HttpStatusCode.reset.isSuccess())
        
        XCTAssertFalse(HttpStatusCode.badRequest.isSuccess())
        XCTAssertFalse(HttpStatusCode.unauthorized.isSuccess())
        XCTAssertFalse(HttpStatusCode.paymentRequired.isSuccess())
        XCTAssertFalse(HttpStatusCode.notFound.isSuccess())
        XCTAssertFalse(HttpStatusCode.methodNotAllowed.isSuccess())
        XCTAssertFalse(HttpStatusCode.notAcceptable.isSuccess())
        XCTAssertFalse(HttpStatusCode.proxyAuthenticationRequired.isSuccess())
        XCTAssertFalse(HttpStatusCode.requestTimeout.isSuccess())
        XCTAssertFalse(HttpStatusCode.conflict.isSuccess())
        XCTAssertFalse(HttpStatusCode.gone.isSuccess())
        XCTAssertFalse(HttpStatusCode.lengthRequired.isSuccess())
        XCTAssertFalse(HttpStatusCode.preconditionFailed.isSuccess())
        XCTAssertFalse(HttpStatusCode.requestEntityTooLarge.isSuccess())
        XCTAssertFalse(HttpStatusCode.requestURITooLong.isSuccess())
        XCTAssertFalse(HttpStatusCode.unsupportedMediaType.isSuccess())
        XCTAssertFalse(HttpStatusCode.requestRangeNotSatisfiable.isSuccess())
        XCTAssertFalse(HttpStatusCode.expextacionFailed.isSuccess())
        XCTAssertFalse(HttpStatusCode.unprocessableEntity.isSuccess())
        
        XCTAssertFalse(HttpStatusCode.internalServerError.isSuccess())
        XCTAssertFalse(HttpStatusCode.notImplemented.isSuccess())
        XCTAssertFalse(HttpStatusCode.badGateway.isSuccess())
        XCTAssertFalse(HttpStatusCode.serviceUnavailable.isSuccess())
        XCTAssertFalse(HttpStatusCode.gatewayTimeout.isSuccess())
        XCTAssertFalse(HttpStatusCode.httpVersionNotSupported.isSuccess())
    }

    func testError() {
        XCTAssertFalse(HttpStatusCode.ok.isError())
        XCTAssertFalse(HttpStatusCode.created.isError())
        XCTAssertFalse(HttpStatusCode.accepted.isError())
        XCTAssertFalse(HttpStatusCode.noContent.isError())
        XCTAssertFalse(HttpStatusCode.reset.isError())
        
        XCTAssertTrue(HttpStatusCode.badRequest.isError())
        XCTAssertTrue(HttpStatusCode.unauthorized.isError())
        XCTAssertTrue(HttpStatusCode.paymentRequired.isError())
        XCTAssertTrue(HttpStatusCode.notFound.isError())
        XCTAssertTrue(HttpStatusCode.methodNotAllowed.isError())
        XCTAssertTrue(HttpStatusCode.notAcceptable.isError())
        XCTAssertTrue(HttpStatusCode.proxyAuthenticationRequired.isError())
        XCTAssertTrue(HttpStatusCode.requestTimeout.isError())
        XCTAssertTrue(HttpStatusCode.conflict.isError())
        XCTAssertTrue(HttpStatusCode.gone.isError())
        XCTAssertTrue(HttpStatusCode.lengthRequired.isError())
        XCTAssertTrue(HttpStatusCode.preconditionFailed.isError())
        XCTAssertTrue(HttpStatusCode.requestEntityTooLarge.isError())
        XCTAssertTrue(HttpStatusCode.requestURITooLong.isError())
        XCTAssertTrue(HttpStatusCode.unsupportedMediaType.isError())
        XCTAssertTrue(HttpStatusCode.requestRangeNotSatisfiable.isError())
        XCTAssertTrue(HttpStatusCode.expextacionFailed.isError())
        XCTAssertTrue(HttpStatusCode.unprocessableEntity.isError())
        
        XCTAssertFalse(HttpStatusCode.internalServerError.isError())
        XCTAssertFalse(HttpStatusCode.notImplemented.isError())
        XCTAssertFalse(HttpStatusCode.badGateway.isError())
        XCTAssertFalse(HttpStatusCode.serviceUnavailable.isError())
        XCTAssertFalse(HttpStatusCode.gatewayTimeout.isError())
        XCTAssertFalse(HttpStatusCode.httpVersionNotSupported.isError())
    }
    
    func testInternalError() {
        XCTAssertFalse(HttpStatusCode.ok.isInternalError())
        XCTAssertFalse(HttpStatusCode.created.isInternalError())
        XCTAssertFalse(HttpStatusCode.accepted.isInternalError())
        XCTAssertFalse(HttpStatusCode.noContent.isInternalError())
        XCTAssertFalse(HttpStatusCode.reset.isInternalError())
        
        XCTAssertFalse(HttpStatusCode.badRequest.isInternalError())
        XCTAssertFalse(HttpStatusCode.unauthorized.isInternalError())
        XCTAssertFalse(HttpStatusCode.paymentRequired.isInternalError())
        XCTAssertFalse(HttpStatusCode.notFound.isInternalError())
        XCTAssertFalse(HttpStatusCode.methodNotAllowed.isInternalError())
        XCTAssertFalse(HttpStatusCode.notAcceptable.isInternalError())
        XCTAssertFalse(HttpStatusCode.proxyAuthenticationRequired.isInternalError())
        XCTAssertFalse(HttpStatusCode.requestTimeout.isInternalError())
        XCTAssertFalse(HttpStatusCode.conflict.isInternalError())
        XCTAssertFalse(HttpStatusCode.gone.isInternalError())
        XCTAssertFalse(HttpStatusCode.lengthRequired.isInternalError())
        XCTAssertFalse(HttpStatusCode.preconditionFailed.isInternalError())
        XCTAssertFalse(HttpStatusCode.requestEntityTooLarge.isInternalError())
        XCTAssertFalse(HttpStatusCode.requestURITooLong.isInternalError())
        XCTAssertFalse(HttpStatusCode.unsupportedMediaType.isInternalError())
        XCTAssertFalse(HttpStatusCode.requestRangeNotSatisfiable.isInternalError())
        XCTAssertFalse(HttpStatusCode.expextacionFailed.isInternalError())
        XCTAssertFalse(HttpStatusCode.unprocessableEntity.isInternalError())
        
        XCTAssertTrue(HttpStatusCode.internalServerError.isInternalError())
        XCTAssertTrue(HttpStatusCode.notImplemented.isInternalError())
        XCTAssertTrue(HttpStatusCode.badGateway.isInternalError())
        XCTAssertTrue(HttpStatusCode.serviceUnavailable.isInternalError())
        XCTAssertTrue(HttpStatusCode.gatewayTimeout.isInternalError())
        XCTAssertTrue(HttpStatusCode.httpVersionNotSupported.isInternalError())
    }
    
}
