//
//  SeparateItemDetailView.swift
//  Storage
//
//  Created by Hatis Vlad Gabriel  on 03/06/2026.
//

import SwiftUI
import SwiftData
import UIKit

struct SeparateItemDetailView: View {
    var item: ProductTemplate
    var unit: InventoryUnit
    var body: some View {
        
        VStack{
        Text("Brand: \(item.brand)")
                .bold()
                .font(.title)
            Text("Model: \(item.model)")
                .font(.subheadline)
            
        }
        .padding()
        VStack{
            if let imagedata=unit.img, let uiImage = UIImage(data: imagedata){
                Image(uiImage: uiImage)
                    .resizable()
                   // .scaledToFit()
                    .frame(width:300, height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 17))
                    .padding()
            }
            else {
                // If there is no photo, show a clean placeholder icon
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .foregroundColor(.secondary)
            }
        }
        
        .padding()
        VStack{
            Text("UIID:\(unit.uniqeID.uuidString)")
                .padding()
            Text("Description: \(unit.itemInfo)")
                .padding()
        }
    }
}

#Preview {
    let testTemplate = ProductTemplate(brand: "HP", model: "HSTNN-IX11", category: "Tech", quantity: 1)
    let testUnit = InventoryUnit(serialNumber: "SN12345", itemInfo: "Bottom-latch mechanical variant")
    SeparateItemDetailView(item: testTemplate, unit: testUnit)
    
}
