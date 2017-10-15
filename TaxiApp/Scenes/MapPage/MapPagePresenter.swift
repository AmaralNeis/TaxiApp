//
//  MapPagePresenter
//  TaxiApp
//
//  Created by dede.exe on 14/10/17.
//Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

public class MapPagePresenter : NSObject {
    
    private(set) public weak var view           : MapPageView?
    private(set) public var interactor          : MapPageInput?
    private(set) public var router              : MapPageWireframe?
    
    private var followUser                       : Bool = true
    private(set) public var currentLocation     : Coordinate = Coordinate(latitude: 0, longitude: 0)
    private(set) public var zoom                : Double = 0.0
    private let defaultZoom                     : Double = 17.0
        
    public override init() {
        super.init()
        zoom = defaultZoom
    }
    
    public func inject(view: MapPageView?, interactor:MapPageInput?, router:MapPageWireframe?) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    fileprivate func assertDependencies() {
        assert(view != nil, "No view defined in presenter")
        assert(interactor != nil, "No interactor defined in presenter")
        assert(router != nil, "No router defined in presenter")
    }
}

// MARK: - Presenter Delegates
extension MapPagePresenter : MapPageModule {
    public func start() {
        assertDependencies()
        view?.plotNewMap(coordinate: currentLocation, zoom: zoom)
        interactor?.startLocation()
    }
    
    public func getCurrentLocation() {
        assertDependencies()
        zoom = (zoom > defaultZoom) ? zoom : defaultZoom
        view?.updateMapLocation(coordinate: self.currentLocation, zoom: zoom)
    }
}

// MARK: - Output Interactor Delegate
extension MapPagePresenter : MapPageOutput {
    public func fetchDrivers(_ drivers: [Driver]) {
        
    }
    
    public func fetchUserLocation(coordinate:Coordinate) {
        currentLocation = coordinate
        view?.setPin(user: coordinate)
        
        if followUser {
            followUser = false
            view?.updateMapLocation(coordinate:currentLocation, zoom: self.zoom)
        }
    }
}

