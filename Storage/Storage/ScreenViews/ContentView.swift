//
//  ContentView.swift
//  Storage
//
//  Created by Vlad-Gabriel Hatis on 02/04/2026.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var selectedTab=0
    @AppStorage("appTheme") var appTheme: Int=0
    var body: some View
    {
        TabView(selection: $selectedTab){
            
            Tab(Constants.homeString, systemImage: Constants.homeIcon,value: 0)
            {
                HomeView(selectedTab: $selectedTab)
        }
            
            
            Tab(Constants.searchString, systemImage: Constants.searchIcon,value: 1)
            {
                SearchView()
            }
            
            
          /*  Tab(Constants.favsString, systemImage: Constants.favsIcon,value:2)
            {
                Text("Comming Soon")
            }*/
            
        
            
            Tab(Constants.addString, systemImage: Constants.addIcon,value:2)
            {
                AddItemsView(selectedTab: $selectedTab)
            }
            
            Tab(Constants.setingsString, systemImage: Constants.settingsIcon, value:3)
            {
                SettingsView()
            }
            
            
        }
        .preferredColorScheme(appTheme == 1 ? .light : appTheme == 2 ? .dark : nil)
                
        }
    
         
    }
   


#Preview {
    ContentView()
        .modelContainer(for: InventoryItem.self, inMemory: true)
}

