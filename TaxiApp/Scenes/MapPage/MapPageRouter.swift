//
//  MapPageRouter.swift
//  TaxiApp
//
//  Created by dede.exe on 14/10/17.
//Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit

public class MapPageRouter {
    
    fileprivate weak var viewController : UIViewController?
    
    public init() {}
    
    public func inject(viewController:UIViewController?) {
        self.viewController = viewController
    }
    
    fileprivate func assertDependencies() {
        assert(viewController != nil, "ViewController was not set to the Router")
    }
}

// MARK: - Wireframe Delegate
extension MapPageRouter : MapPageWireframe {
    public func gotoSearch(updating updatable:Updatable?) {
        DispatchQueue.main.async {[unowned self] in
            let destination = MapSearchConfigurator().create(updating: updatable)
            destination.modalPresentationStyle = .overCurrentContext
            self.viewController?.present(destination, animated: false, completion: nil)
        }
    }
}
