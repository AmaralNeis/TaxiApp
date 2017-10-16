//
//  MapSearchViewController.swift
//  TaxiApp
//
//  Created by dede.exe on 15/10/17.
//Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit

class MapSearchViewController: UIViewController {
    
    @IBOutlet weak var containerMapView     : UIView!
    @IBOutlet weak var shadowView           : UIView!
    @IBOutlet weak var infoLocationView     : MapSearchAddressView!
    @IBOutlet weak var containerTableView   : UIView!
    @IBOutlet weak var tableView            : UITableView!
    
    fileprivate var presenter : MapSearchModule?
    
    init() {
        let identifier = String(describing: MapSearchViewController.self)
        super.init(nibName: identifier, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assertDependencies()
    	setup()
        infoLocationView.getFocus()
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func inject(presenter:MapSearchPresenter?) {
        self.presenter = presenter
    }
    
    fileprivate func assertDependencies() {
        assert(presenter != nil, "Did not set Presenter to the view")
    }

    fileprivate func setup() {
        setupShadowView()
        setupInfoLocationView()
        setupView()
        setupTableView()
    }
}

// MARK: - View Delegate
extension MapSearchViewController : MapSearchView {
    func show(something: String) {
        //Implement what to show here
    }
}

// MARK: - View Delegate
extension MapSearchViewController : MapSearchAddressViewDelegate {
    func mapSearchAddressView(view: MapSearchAddressView, didTouch actionButton: MapSearchAddressViewButton) {
        
    }
    
    func mapSearchAddressView(view: MapSearchAddressView, didUpdate text: String?) {
        presenter?.search(address: text)
    }
}


// MARK: - Configurations
extension MapSearchViewController {
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
    
    func setupView() {
        view.backgroundColor = UIColor.lightGray
        containerMapView.backgroundColor = .clear
        containerTableView.backgroundColor = .clear
        containerTableView.layer.cornerRadius = 3.0
        containerTableView.layer.masksToBounds = true
    }
    
    func setupTableView() {
        tableView.separatorStyle = .none
        tableView.keyboardDismissMode = .onDrag
    }
}
