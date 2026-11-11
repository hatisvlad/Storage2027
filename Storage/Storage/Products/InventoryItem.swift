//
//  InventoryItem.swift
//  Storage
//
//  Created by Hatis Vlad Gabriel  on 02/05/2026.
//

import Foundation
import SwiftData
@Model
class InventoryItem {
    var brand: String?
    var image: Data?
    var quantity: Int?
    var model: String?
    var serialNumber: String?
    var category: String?
    var additionalDetails: String?
    var uniqueID: String?
    var availability: Bool?
    var availableAccesories: String?
    var deliveryDetails: String?
    var entryDate: Date?
    init(brand: String?, image: Data? = nil, quantity: Int, model: String?, serialNumber: String?, category: String?, additionalDetails: String?, availability: Bool, availableAccesories: String?, deliveryDetails:String?, entryDate: Date? = nil) {
        self.brand = brand
        self.image = image
        self.quantity = quantity
        self.model = model
        self.serialNumber = serialNumber
        self.category = category
        self.additionalDetails = additionalDetails
        self.uniqueID=UUID().uuidString
        self.availability=availability
        self.availableAccesories=availableAccesories
        self.deliveryDetails=deliveryDetails
        self.entryDate=entryDate
        
    }
}


