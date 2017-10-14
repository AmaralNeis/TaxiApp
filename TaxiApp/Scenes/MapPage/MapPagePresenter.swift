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
    
    public var followUser                       : Bool = true
    private(set) public var currentLocation     : Coordinate = Coordinate(latitude: 0, longitude: 0)
    private(set) public var zoom                : Double = 17.0
        
    public override init() {
        super.init()
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
}

// MARK: - Output Interactor Delegate
extension MapPagePresenter : MapPageOutput {
    public func fetchUserLocation(coordinate:Coordinate) {
        currentLocation = coordinate
        view?.setUserPin(coordinate:currentLocation)
        
        if followUser {
            view?.updateMapLocation(coordinate:currentLocation, zoom: self.zoom)
        }
    }
}

