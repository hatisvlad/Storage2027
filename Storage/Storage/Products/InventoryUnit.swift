//
//  InventoryUnit.swift
//  Storage
//
//  Created by Hatis Vlad Gabriel  on 20/05/2026.
//

import Foundation
import SwiftData

@Model class InventoryUnit{
    var serialNumber: String
    var img:Data?
    var uniqeID: UUID = UUID()
    var itemInfo: String
    var product:ProductTemplate?
    init(serialNumber: String, itemInfo:String) {
        self.serialNumber = serialNumber
        self.itemInfo=itemInfo

    }
}

