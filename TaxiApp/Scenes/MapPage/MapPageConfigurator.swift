//
//  MapPageConfigurator.swift
//  TaxiApp
//
//  Created by dede.exe on 14/10/17.
//Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit

public class MapPageConfigurator {
    
    public init() {}
    
    func create() -> MapPageViewController {
        let viewController = MapPageViewController()
        let presenter = MapPagePresenter()
        let router = MapPageRouter()
        let interactor = MapPageInputInteractor()
        
        presenter.inject(view: viewController, interactor: interactor, router: router)
        interactor.inject(output: presenter)
        viewController.inject(presenter: presenter)
        router.inject(viewController: viewController)
        
        return viewController
    }
}
