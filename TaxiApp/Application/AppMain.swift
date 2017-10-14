//
//  AppMain.swift
//  TaxiApp
//
//  Created by dede.exe on 14/10/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit

public final class AppMain {
    
    private var window : UIWindow?
    
    public init(window:UIWindow?) {
        self.window = window
    }
    
    public func start(with Application:UIApplication, options:[UIApplicationLaunchOptionsKey: Any]?) -> Bool{
        return createStartScreen()
    }
    
    private func createStartScreen() -> Bool {
        let viewController = MapPageConfigurator().create()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        return true
    }
    
}
