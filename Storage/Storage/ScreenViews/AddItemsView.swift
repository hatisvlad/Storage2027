//
//  AddItemsView.swift
//  Storage
//
//  Created by Hatis Vlad Gabriel  on 02/05/2026.
//

import SwiftUI
import SwiftData
import PhotosUI

struct AddItemsView: View {
    @Binding var selectedTab:Int
    @Environment(\.modelContext) private var modelContext
    @Query var existingItems:[InventoryItem]
    @State private var brand=""
    @State private var model=""
    @State private var serialNumber=""
    @State private var quantity=""
    @State private var aditionaldetails=""
    @State private var category=Constants.select
    @State private var isShowingscanner: Bool = false
    @State private var selectedPhotoItem: PhotosPickerItem?
    @State private var selectedImageData: Data?
    @State private var avilableAccesories=""
    @State private var availability:Bool = true
    @State private var deliveryDetails = ""
    @State private var entryDate:Date?
    @State private var availableAccesories=" "
    
    
    var body: some View {
        
        NavigationStack{
            Form{
                Section("General Info")
                {
                    TextField(Constants.brandString, text: $brand)
                    TextField(Constants.modelString, text: $model)
                    Picker(Constants.categoryString, selection: $category)
                    {
                        Text(Constants.home).tag(Constants.home)
                        Text(Constants.tech).tag(Constants.tech)
                        Text(Constants.os).tag(Constants.os)
                    }
                    
                    
                    //TextField(Constants.categoryString, text: $category)
                }
                
                Section("Specifics")
                {
                    HStack{
                        TextField(Constants.serialstring ,text :$serialNumber)
                        Button{withAnimation{isShowingscanner=true}
                        }label:{Image (systemName: "barcode")}
                            .font(.largeTitle)
                        
                        
                    }
                    
                    TextField(Constants.availableAccString ,text :$availableAccesories)
                    
                    
                    
                    
                }
                
                Section(Constants.notesString)
                {
                    TextEditor(text :$aditionaldetails)
                        .frame(height: 300)
                }
                Section(Constants.addPhotoString)
                {
                    PhotosPicker(selection: $selectedPhotoItem, matching: .images){
                        Label(Constants.selectPhotoString, systemImage: Constants.selectPhotoIcon)
                    }
                }
                
                Section()
                {
                    Button{withAnimation{
                        saveProduct()
                    }
                    }label: {Text("Save Product")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        
                    }
                }
                
                
                
                
            }
            .navigationTitle("Add Product")
            .sheet(isPresented: $isShowingscanner)
            {
                ScanView(scannedCode: $serialNumber)
                //NUSH DACA MERGE
            }
            .onChange(of: selectedPhotoItem) { oldValue, newValue in
                Task {
                    if let loadedData = try? await newValue?.loadTransferable(type: Data.self) {
                        selectedImageData = loadedData
                    }
                }
                
            }
            
        }
    }
    
        func saveProduct() {
            withAnimation {
                let newItem = InventoryItem(brand: brand, image: selectedImageData, quantity: Int(quantity) ?? 1, model: model, serialNumber: serialNumber, category: category, additionalDetails: aditionaldetails, availability: availability, availableAccesories: availableAccesories, deliveryDetails: deliveryDetails, entryDate: entryDate)
                
                
                modelContext.insert(newItem)
                    
                    brand = ""
                    model = ""
                    serialNumber = ""
                    quantity = ""
                    aditionaldetails = ""
                    category = ""
                    availableAccesories = ""
                    deliveryDetails = ""
                    availability = true
                    entryDate = nil
                    selectedImageData = nil
                    selectedPhotoItem = nil
                    
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
        }
    }
    
    
    #Preview {
        //AddItemsView(selectedTab: .constant(0))
    }



