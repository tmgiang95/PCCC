//
//  GatewayCollectionViewCell.swift
//  PCCC
//
//  Created by Quang Thai on 12/15/18.
//  Copyright © 2018 Quang Thai. All rights reserved.
//

import UIKit

class GatewayCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var nameDevice: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func fillData(device : Device) {
        mainView.backgroundColor = device.getStatusBackground()
        nameDevice.text = device.name
    }
    
}
