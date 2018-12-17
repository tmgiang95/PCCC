//
//  Device.swift
//  PCCC
//
//  Created by Quang Thai on 12/15/18.
//  Copyright © 2018 Quang Thai. All rights reserved.
//

import Foundation
import UIKit
class Device {
    var id: String
    var status: Int
    var name: String
    
    init(id: String, status: Int, name: String) {
        self.id = id
        self.status = status
        self.name = name
    }
    
    func getStatusBackground() -> UIColor? {
        switch status {
        case 2:
            return UIColor.red
        case 1:
            return UIColor(hexString: "#237F11")
        default:
            return UIColor.gray
        }
    }
    func getStatusString() -> String {
        switch status {
        case 2:
            return "Warning"
        case 1:
            return "Connected"
        default:
            return "Disconnected"
        }
    }
}
