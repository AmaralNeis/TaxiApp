//
//  MapPageInputInteractor.swift
//  TaxiApp
//
//  Created by dede.exe on 14/10/17.
//Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

public class MapPageInputInteractor : MapPageInput {
    
    fileprivate weak var output : MapPageOutput?
    
    public func inject(output:MapPageOutput?) {
        self.output = output
    }

    private func assertDependencies() {
   		assert(output != nil, "Did not set output to the input interactor")
    }
    
    public func get(something:String) {
        assertDependencies()
        //Implement how to get data here
    }

}
