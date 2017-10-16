//
//  MapSearchView.swift
//  TaxiApp
//
//  Created by dede.exe on 15/10/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit

enum MapSearchAddressViewButton {
    case back
    case cancel
}

protocol MapSearchAddressViewDelegate : class {
    func mapSearchAddressView(view:MapSearchAddressView, didTouch actionButton:MapSearchAddressViewButton)
    func mapSearchAddressView(view:MapSearchAddressView, didUpdate text:String?)
}

class MapSearchAddressView: UIView {
    
    @IBOutlet weak var leftButton   : UIButton!
    @IBOutlet weak var rightButton  : UIButton!
    @IBOutlet weak var textField    : UITextField!
    
    weak var delegate : MapSearchAddressViewDelegate?
    
    override func awakeFromNib() {
        setup()
    }
    
    func setup() {
        layer.cornerRadius = 3.0
        layer.masksToBounds = true
        backgroundColor = UIColor.white
        setupLeftButton()
        setupRightButton()
        setupTextField()
    }
    
    @objc func actionButton(sender:UIButton) {
        if sender == leftButton {
            delegate?.mapSearchAddressView(view: self, didTouch: .back)
            return
        }
        
        delegate?.mapSearchAddressView(view: self, didTouch: .cancel)
    }
    
    func getFocus() {
        textField.becomeFirstResponder()
    }
}

// MARK: - Configurations
extension MapSearchAddressView {
    func setupLeftButton() {
        leftButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        leftButton.tintColor = .lightGray
        leftButton.setTitle(nil, for: UIControlState())
        leftButton.setImage(IconIdentifier.search.image, for: UIControlState())
    }
    
    func setupRightButton() {
        rightButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        rightButton.tintColor = .lightGray
        rightButton.setTitle(nil, for: UIControlState())
        rightButton.setImage(IconIdentifier.search.image, for: UIControlState())
    }
    
    func setupTextField() {
        textField.delegate = self
    }
}

// MARK: - Textfield Delegate
extension MapSearchAddressView : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = ((textField.text ?? "") as NSString).replacingCharacters(in: range, with: string)
        delegate?.mapSearchAddressView(view: self, didUpdate: String(text))
        return true
    }
}

