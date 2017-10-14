//
//  MapPagePresenter
//  TaxiApp
//
//  Created by dede.exe on 14/10/17.
//Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

public class MapPagePresenter {
    
    fileprivate weak var view   : MapPageView?
    fileprivate var interactor  : MapPageInput?
    fileprivate var router      : MapPageWireframe?
    
    public init() {}
    
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
    public func doSomething() {
        assertDependencies()
        //Implements presenter actions here
    }

}

// MARK: - Output Interactor Delegate
extension MapPagePresenter : MapPageOutput {
    public func fetch(something: String) {
        assertDependencies()
        //Handle fetched data here
    }
}
