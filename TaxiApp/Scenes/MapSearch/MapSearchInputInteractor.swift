//
//  MapSearchInputInteractor.swift
//  TaxiApp
//
//  Created by dede.exe on 15/10/17.
//Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

public class MapSearchInputInteractor : MapSearchInput {
    
    fileprivate weak var output : MapSearchOutput?
    
    public func inject(output:MapSearchOutput?) {
        self.output = output
    }

    private func assertDependencies() {
   		assert(output != nil, "Did not set output to the input interactor")
    }
    
    public func search(address: String) {
        guard address.trimmingCharacters(in: .whitespacesAndNewlines).count > 0 else { return }
        
        let service = PlaceFilterService(place: address)
        service.get { [weak self] result, headers in
            switch result {
                case .fail: break
                case .success(_, let addresses):
                    self?.handleResult(addresses: addresses)
            }
        }
    }
}


extension MapSearchInputInteractor {
    func handleResult(addresses:[Address]) {
        output?.fetch(addressess: addresses)
    }
}
