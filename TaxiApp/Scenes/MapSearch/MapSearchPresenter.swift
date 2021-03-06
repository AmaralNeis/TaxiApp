//
//  MapSearchPresenter
//  TaxiApp
//
//  Created by dede.exe on 15/10/17.
//Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

public class MapSearchPresenter {
    
    fileprivate weak var view       : MapSearchView?
    fileprivate var interactor      : MapSearchInput?
    fileprivate var router          : MapSearchWireframe?
    
    private var searchText          : String?
    private var trigger             : Trigger?
    private var updatableDelegate   : Updatable?
    
    public init() {
        setupTrigger()
    }
    
    public func inject(view: MapSearchView?, interactor:MapSearchInput?, router:MapSearchWireframe?) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    public func inject(updatable:Updatable?) {
        self.updatableDelegate = updatable
    }
    
    fileprivate func assertDependencies() {
        assert(view != nil, "No view defined in presenter")
        assert(interactor != nil, "No interactor defined in presenter")
        assert(router != nil, "No router defined in presenter")
    }
    
}

//MARK: - Presenter Delegates
extension MapSearchPresenter : MapSearchModule {
    public func backToMap() {
        self.assertDependencies()
        router?.close()
    }
    
    public func search(address: String?) {
        self.assertDependencies()
        self.searchText = address
        trigger?.execute()
    }
    
    public func searchDetail(of address: Address) {
        self.assertDependencies()
        interactor?.searchDetails(of: address)
    }
    
    public func resetSearch() {
        searchText = ""
        view?.show(addresses: [])
        view?.eraseSearch()
    }
}

//MARK: - Output Interactor Delegate
extension MapSearchPresenter : MapSearchOutput {
    public func fetch(addressess: [Address]) {
        assertDependencies()
        view?.show(addresses: addressess)
    }
    
    public func fetch(address: Address) {
        assertDependencies()
        updatableDelegate?.update(with: ["coordinate" : address.coordinate as Any])
        router?.close()
    }
}

//MARK: - Configurations
extension MapSearchPresenter {
    public func setupTrigger() {
        trigger = Trigger(in: 0.7) { [weak self] in
            self?.interactor?.search(address: self?.searchText ?? "")
        }
    }
}
