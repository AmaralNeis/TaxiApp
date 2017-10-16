//
//  MapSearchTableHandler.swift
//  TaxiApp
//
//  Created by dede.exe on 16/10/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit

protocol MapSearchTableHandlerDelegate : class {
    func mapSearchTableHandler(tableHandler:MapSearchTableHandler, didSelect address:Address)
}

class MapSearchTableHandler : NSObject {
    
    public var addresses: [Address] = [] {
        didSet { self.reload() }
    }
    
    private weak var tableView : UITableView?
    weak var delegate : MapSearchTableHandlerDelegate?
    
    override init() {
        super.init()
    }
    
    func setupTableView(_ tableView:UITableView?) {
        tableView?.separatorStyle = .none
        tableView?.backgroundColor = .clear
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.estimatedRowHeight = UITableViewAutomaticDimension
    }
    
    func registerCells(tableView:UITableView?) {
        tableView?.registerCell(named: String(describing:PlaceCell.self))
    }
    
    func reload() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView?.reloadData()
        }
    }
}

// MARK: TableView DataSource and Delegate
extension MapSearchTableHandler : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        self.tableView = tableView
        setupTableView(tableView)
        registerCells(tableView: tableView)
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.addresses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return createPlaceCell(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let address = addresses[indexPath.row]
        delegate?.mapSearchTableHandler(tableHandler: self, didSelect: address)
    }
}

// MARK: Cell Creation
extension MapSearchTableHandler {
    func createPlaceCell(at indexPath:IndexPath) -> UITableViewCell {
        let identifier = String(describing:PlaceCell.self)
        guard let cell = tableView?.dequeueReusableCell(withIdentifier: identifier) as? PlaceCell else {
            return UITableViewCell()
        }
        
        let address = self.addresses[indexPath.row]
        cell.update(address: address)
        cell.selectionStyle = .none
        return cell
    }
}
