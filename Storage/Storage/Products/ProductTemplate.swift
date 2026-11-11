//
//  ProductTemplate.swift
//  Storage
//
//  Created by Hatis Vlad Gabriel  on 09/05/2026.
//

import Foundation
import SwiftData
@Model class ProductTemplate {
    @Relationship(deleteRule: .cascade) var units:[InventoryUnit]=[]
    var brand:String
    var model:String
    var category:String
    var quantity:Int
    init(brand: String, model: String, category: String,quantity:Int) {
        self.brand = brand
        self.model = model
        self.category = category
        self.quantity = quantity
    }
    
    
}
