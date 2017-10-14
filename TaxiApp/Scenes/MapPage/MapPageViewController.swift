//
//  MapPageViewController.swift
//  TaxiApp
//
//  Created by dede.exe on 14/10/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit
import GoogleMaps

class MapPageViewController: UIViewController {

    @IBOutlet weak var containerMapView : UIView!
    
    private var userPin     : GMSMarker!
    private var mapView     : GMSMapView!
    
    private var presenter   : MapPageModule?
    
    init() {
        let identifier = String(describing: MapPageViewController.self)
        super.init(nibName: identifier, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assertDependencies()
    	setup()
        presenter?.start()
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func inject(presenter:MapPagePresenter?) {
        self.presenter = presenter
    }
    
    fileprivate func assertDependencies() {
        assert(presenter != nil, "Did not set Presenter to the view")
    }

	fileprivate func setup() {
        startObservers()
	}
    
    deinit {
        stopObservers()
    }
}

// MARK: - View Delegate
extension MapPageViewController : MapPageView {
    func plotNewMap(coordinate:Coordinate, zoom:Double) {
        assertDependencies()        
        let camera = GMSCameraPosition.camera(withLatitude: coordinate.latitude, longitude: coordinate.longitude, zoom: Float(zoom))
        mapView = GMSMapView.map(withFrame: containerMapView.bounds, camera: camera)
        mapView.delegate = self
        containerMapView.addSubview(mapView)
    }
    
    func updateMapLocation(coordinate:Coordinate, zoom:Double) {
        DispatchQueue.main.async { [unowned self] in
            let camera = GMSCameraPosition.camera(withLatitude: coordinate.latitude, longitude: coordinate.longitude, zoom: Float(zoom))
            self.mapView.animate(to: camera)
        }
    }
    
    func setUserPin(coordinate:Coordinate) {
        DispatchQueue.main.async { [unowned self] in
            if self.userPin == nil { self.userPin = GMSMarker() }
            self.userPin.position   = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
            self.userPin.title      = "Me"
            self.userPin.map        = self.mapView
        }
    }
}

// MARK: - MapsView Delegate
extension MapPageViewController : GMSMapViewDelegate {

}

// MARK: - Configurations
extension MapPageViewController { 
    func startObservers() {
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(showKeyboard), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        nc.addObserver(self, selector: #selector(hideKeyboard), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func stopObservers() {
        let nc = NotificationCenter.default
        nc.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        nc.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc func showKeyboard(notification:Notification) {
        if let frame = notification.userInfo?["UIKeyboardBoundsUserInfoKey"] as? NSValue {
            let finalFrame = frame.cgRectValue
            let frameHeight = finalFrame.height
        }
    }
    
    @objc func hideKeyboard(notification:Notification) {
        if let frame = notification.userInfo?["UIKeyboardBoundsUserInfoKey"] as? NSValue {
            let finalFrame = frame.cgRectValue
            let frameHeight = finalFrame.height
        }
    }
}
