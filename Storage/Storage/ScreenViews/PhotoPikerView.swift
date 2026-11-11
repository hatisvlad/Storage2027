//
//  PhotoPikerView.swift
//  Storage
//
//  Created by Hatis Vlad Gabriel  on 09/06/2026.
//

import SwiftUI
import SwiftData
import PhotosUI



struct PhotoPikerView: View {
    @State var selectedItems: [PhotosPickerItem] = []


    var body: some View {
        PhotosPicker(selection: $selectedItems,
                     matching: .images) {
            Text("Add Image")
        }
    }
}
#Preview {
    PhotoPikerView()
}
