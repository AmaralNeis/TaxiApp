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
    @IBOutlet weak var shadowView       : UIView!
    @IBOutlet weak var infoLocationView : MapLocationView!
    @IBOutlet weak var locationButton   : UIButton!
    
    private var devicePin       : GMSMarker!
    private var locationPin     : GMSMarker!
    private var drivers         : [GMSMarker] = []
    private var mapView         : GMSMapView!
    
    private var presenter       : MapPageModule?
    
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
        setupShadowView()
        setupInfoLocationView()
        setupLocationButton()
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupShadowView()
    }
}

// MARK: - View Delegate
extension MapPageViewController : MapPageView {
    func showMarkers(drivers: [Driver]) {
        DispatchQueue.main.async { [unowned self] in
            self.cleanDrivers()
            self.showDrivers(drivers)
        }
    }

    func plotNewMap(coordinate:Coordinate, zoom:Double) {
        assertDependencies()        
        createMap(coordinate: coordinate, zoom: zoom)
    }
    
    func updateMapLocation(coordinate:Coordinate, zoom:Double) {
        assertDependencies()
        DispatchQueue.main.async { [unowned self] in
            self.setMapLocation(coordinate: coordinate, zoom: zoom)
        }
    }
    
    func showMarker(device coordinate:Coordinate) {
        assertDependencies()
        DispatchQueue.main.async { [unowned self] in
            self.showUserPin(coordinate: coordinate)
        }
    }
    
    func showMarker(location coordinate:Coordinate) {
        assertDependencies()
        DispatchQueue.main.async { [unowned self] in
            self.showLocationPin(coordinate: coordinate)
        }
    }
    
    func showAddress(_ address: Address?) {
        assertDependencies()
        DispatchQueue.main.async { [unowned self] in
            self.infoLocationView.update(address:address)
        }
    }
}

// MARK: - Helpers
extension MapPageViewController {
    func cleanDrivers() {
        drivers.removeAll()
        mapView.clear()
    }
    
    func showDrivers(_ drivers:[Driver]) {
        for (index, driver) in drivers.enumerated() {
            guard let latitude = driver.latitude, let longitude = driver.longitude else { continue }
            let position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let newDriver = GMSMarker(position: position)
            newDriver.icon = IconIdentifier.taximarker.image
            
            if index == 0 {
                newDriver.icon = IconIdentifier.nearesttaximarker.image
            }
            
            newDriver.map = self.mapView
            self.drivers.append(newDriver)
        }
    }
    
    func showUserPin(coordinate:Coordinate) {
        if self.devicePin == nil { self.devicePin = GMSMarker() }
        self.devicePin.position   = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        self.devicePin.title      = "Me"
        self.devicePin.map        = self.mapView
    }
    
    func showLocationPin(coordinate:Coordinate) {
        if self.locationPin == nil { self.locationPin = GMSMarker() }
        self.locationPin.position   = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        self.locationPin.icon       = GMSMarker.markerImage(with: .blue)
        self.devicePin.map          = self.mapView
    }
    
    func setMapLocation(coordinate:Coordinate, zoom:Double) {
        let camera = GMSCameraPosition.camera(withLatitude: coordinate.latitude, longitude: coordinate.longitude, zoom: Float(zoom))
        self.mapView.animate(to: camera)
    }
    
    func createMap(coordinate:Coordinate, zoom:Double) {
        let camera = GMSCameraPosition.camera(withLatitude: coordinate.latitude, longitude: coordinate.longitude, zoom: Float(zoom))
        mapView = GMSMapView.map(withFrame: containerMapView.bounds, camera: camera)
        mapView.delegate = self
        containerMapView.addSubview(mapView)
    }
}

// MARK: - MapsView Delegate
extension MapPageViewController : GMSMapViewDelegate {    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        print(position.target.latitude, position.target.longitude)
        let coordinate = Coordinate(latitude: position.target.latitude, longitude: position.target.longitude)
        presenter?.getDriverAt(coordinate: coordinate)
        presenter?.defineZoom(Double(position.zoom))
    }
}

// MARK: - InfoLocationView Delegate
extension MapPageViewController : MapLocationViewDelegate {
    func mapLocationViewDidTouchActionButton(view: MapLocationView) {
        presenter?.openSearch()
    }
}

// MARK: - Configurations
extension MapPageViewController {
    func setupShadowView() {
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowOffset = CGSize(width: 1, height: 3)
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowRadius = 0.5
        shadowView.layer.shadowOpacity = 0.5
    }
    
    func setupInfoLocationView() {
        infoLocationView.delegate = self
    }
    
    func setupLocationButton() {
        locationButton.setTitle(nil, for: UIControlState())
        locationButton.backgroundColor = UIColor.white
        locationButton.layer.cornerRadius = locationButton.bounds.width / 2
        locationButton.layer.masksToBounds = true
        locationButton.setImage(IconIdentifier.target.image, for: UIControlState())
        locationButton.tintColor = .black
        locationButton.addTarget(self, action: #selector(centerLocation), for: .touchUpInside)
    }
}

// MARK: - Actions
extension MapPageViewController {
    @objc func centerLocation(sender:UIButton) {
        presenter?.getCurrentLocation()
    }
}
