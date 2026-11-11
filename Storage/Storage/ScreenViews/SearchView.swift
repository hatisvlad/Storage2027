//
//  SearchView.swift
//  Storage
//
//  Created by Hatis Vlad Gabriel  on 03/05/2026.
//

import SwiftUI
import SwiftData

struct SearchView: View {
    @Query var allItems: [InventoryItem]
    @State private var searchText = ""
    
    var filteredItems: [InventoryItem] {
        if searchText.isEmpty {
            return []
        } else {
            return allItems.filter { item in
                (item.brand ?? "").localizedCaseInsensitiveContains(searchText) ||
                (item.model ?? "").localizedCaseInsensitiveContains(searchText) ||
                (item.category ?? "").localizedCaseInsensitiveContains(searchText) ||
                (item.serialNumber ?? "").localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredItems) { item in
                    NavigationLink {
                        ItemDetaisView(item: item)
                    } label: {
                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                Text("Quantity: \(item.quantity ?? 1)")
                                    .frame(width: 80, alignment: .leading)
                                Spacer()
                                Text("See more")
                            }
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            
                            Text("\(item.brand ?? "Unknown") \(item.model ?? "Unknown")")
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .font(.headline)
                        .padding(.horizontal, 5)
                        .contentShape(Rectangle())
                        .padding(.horizontal)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .searchable(text: $searchText, prompt: "Search Item")
    }
}

#Preview {
    SearchView()
}
