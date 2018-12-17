//
//  DetailDeviceViewController.swift
//  PCCC
//
//  Created by Quang Thai on 12/15/18.
//  Copyright © 2018 Quang Thai. All rights reserved.
//

import UIKit

class DetailDeviceViewController: UIViewController {

    @IBOutlet weak var deviceIDLabel: UILabel!
    @IBOutlet weak var deviceNameLabel: UILabel!
    @IBOutlet weak var deviceStatusLabel: UILabel!
    private var device:Device?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        // Do any additional setup after loading the view.
    }
    func configureNavigation(title: String) {
        navigationItem.title = title
    }
    func fillData(device: Device) {
        configureNavigation(title: device.name)
        self.device = device
        
    }
    func loadData(){
        guard let d = self.device else {
            return
        }
        deviceIDLabel.text = d.id
        deviceNameLabel.text = d.name
        deviceStatusLabel.text = d.getStatusString()
    }

}
