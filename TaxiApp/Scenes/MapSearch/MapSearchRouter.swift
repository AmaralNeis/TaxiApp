//
//  MapSearchRouter.swift
//  TaxiApp
//
//  Created by dede.exe on 15/10/17.
//Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit

public class MapSearchRouter {
    
    fileprivate weak var viewController : UIViewController?
    
    public init() {}
    
    public func inject(viewController:UIViewController?) {
        self.viewController = viewController
    }
    
    fileprivate func assertDependencies() {
        assert(viewController != nil, "ViewController was not set to the Router")
    }
    
    public func gotoInsideApplication() {
        assertDependencies()
    }
    
}

//MARK: - Wireframe Delegate
extension MapSearchRouter : MapSearchWireframe {
    public func close() {
        viewController?.dismiss(animated: false, completion: nil)
    }
}
