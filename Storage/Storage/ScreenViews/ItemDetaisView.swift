//
//  ItemDetaisView.swift
//  Storage
//
//  Created by Hatis Vlad Gabriel  on 02/05/2026.
//

import SwiftUI

struct ItemDetaisView: View {
    var item: InventoryItem
    var title: String
    var lotDevices: [InventoryItem]

    var body: some View {
        VStack {
            HStack {
                Text("Brand/Manufacture:")
                Text(item.brand ?? "Unknown")
            }
            .padding(.bottom)

            HStack {
                Text("Model:")
                Text(item.model ?? "Unknown")
            }
            .padding(.bottom)

            HStack {
                Text("Category: ")
                Text(item.category ?? "Unknown")
            }
            .padding(.bottom)

            List {
                ForEach(lotDevices) { device in
                    NavigationLink {
                        SeparateItemDetailView(item: device)
                    } label: {
                        Text("SN: \(device.serialNumber ?? "Unknown")")
                    }
                }
            }
        }
        .navigationTitle(title)
    }
}

#Preview {
    // ItemDetaisView()
}
