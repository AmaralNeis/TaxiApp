//
//  PlaceCell.swift
//  TaxiApp
//
//  Created by dede.exe on 16/10/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit

class PlaceCell: UITableViewCell {
    
    @IBOutlet weak var firstLabel : UILabel!
    @IBOutlet weak var secondLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func update(address:Address) {
        firstLabel.text = address.street
        secondLabel.text = address.city
    }
    
}
