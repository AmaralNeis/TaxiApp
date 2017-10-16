//
//  MapLocationView.swift
//  TaxiApp
//
//  Created by dede.exe on 15/10/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit

protocol MapLocationViewDelegate : class {
    func mapLocationViewDidTouchActionButton(view:MapLocationView)
}

class MapLocationView: UIView {
    
    @IBOutlet weak var firstLabel       : UILabel!
    @IBOutlet weak var secondLabel      : UILabel!
    @IBOutlet weak var locationButton   : UIButton!
    
    weak var delegate : MapLocationViewDelegate?
    
    override func awakeFromNib() {
        setup()
    }
    
    func update(address:Address?) {
        firstLabel.text    = address?.street
        secondLabel.text   = (address?.region ?? "") + ", " + (address?.city ?? "")
    }

    func setup() {
        layer.cornerRadius = 3.0
        layer.masksToBounds = true
        locationButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        locationButton.tintColor = .lightGray
        locationButton.setTitle(nil, for: UIControlState())
        locationButton.setImage(IconIdentifier.search.image, for: UIControlState())
        backgroundColor = UIColor.white
    }
    
    @objc func actionButton(sender:UIButton) {
        delegate?.mapLocationViewDidTouchActionButton(view: self)
    }
}
