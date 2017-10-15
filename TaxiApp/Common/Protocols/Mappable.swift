//
//  Mappable.swift
//  TaxiApp
//
//  Created by dede.exe on 14/10/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

protocol Mappable : Codable {
    init?(jsonString:String)
}

extension Mappable {
    init?(jsonString: String) {
        guard let data = jsonString.data(using: .utf8) else {
            return nil
        }
        
        do {
            self = try JSONDecoder().decode(Self.self, from: data)
        } catch {
            return nil
        }
    }
}
