//
//  HttpStatusCode.swift
//  TaxiApp
//
//  Created by dede.exe on 16/10/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

import Foundation

public enum HttpStatusCode : Int {
    
    case ok                                 = 200
    case created                            = 201
    case accepted                           = 202
    case noContent                          = 204
    case reset                              = 205
    
    case badRequest                         = 400
    case unauthorized                       = 401
    case paymentRequired                    = 402
    case forbidden                          = 403
    case notFound                           = 404
    case methodNotAllowed                   = 405
    case notAcceptable                      = 406
    case proxyAuthenticationRequired        = 407
    case requestTimeout                     = 408
    case conflict                           = 409
    case gone                               = 410
    case lengthRequired                     = 411
    case preconditionFailed                 = 412
    case requestEntityTooLarge              = 413
    case requestURITooLong                  = 414
    case unsupportedMediaType               = 415
    case requestRangeNotSatisfiable         = 416
    case expextacionFailed                  = 417
    case unprocessableEntity                = 422
    
    case internalServerError                = 500
    case notImplemented                     = 501
    case badGateway                         = 502
    case serviceUnavailable                 = 503
    case gatewayTimeout                     = 504
    case httpVersionNotSupported            = 505
    
    func isSuccess() -> Bool {
        if case 200...399 = self.rawValue {
            return true
        }
        return false
    }
    
    func isError() -> Bool {
        if case 400...499 = self.rawValue {
            return true
        }
        return false
    }
    
    func isInternalError() -> Bool {
        if case 500...599 = self.rawValue {
            return true
        }
        return false
    }
}
