//
//  Item.swift
//  Storage
//
//  Created by Vlad-Gabriel Hatis on 02/04/2026.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
