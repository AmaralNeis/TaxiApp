//
//  MapSearchConfigurator.swift
//  TaxiApp
//
//  Created by dede.exe on 15/10/17.
//Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit

public class MapSearchConfigurator {
    
    public init() {}
    
    func create(updating updatable:Updatable?) -> MapSearchViewController {
        let viewController = MapSearchViewController()
        let presenter = MapSearchPresenter()
        let router = MapSearchRouter()
        let interactor = MapSearchInputInteractor()
        
        presenter.inject(view: viewController, interactor: interactor, router: router)
        presenter.inject(updatable: updatable)
        interactor.inject(output: presenter)
        viewController.inject(presenter: presenter)
        router.inject(viewController: viewController)
        
        return viewController
    }
    
}

