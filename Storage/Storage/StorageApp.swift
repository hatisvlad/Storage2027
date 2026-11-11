//
//  StorageApp.swift
//  Storage
//
//  Created by Vlad-Gabriel Hatis on 02/04/2026.
//

import SwiftUI
import SwiftData

@main
struct StorageApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    
        .modelContainer(for: [InventoryItem.self])
    }
}
