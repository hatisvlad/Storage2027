//
//  SettingsView.swift
//  Storage
//
//  Created by Hatis Vlad Gabriel  on 04/05/2026.
//

import SwiftUI
import SwiftData


struct SettingsView: View {
    @AppStorage("username") var userName : String = "User"
    @AppStorage("appTheme") var appTheme: Int=0
    var body: some View {
        
        NavigationStack
        {
            Form{
                Section("User")
                {
                    TextField("Change Username", text: $userName)
                        .autocorrectionDisabled()
                }
               
                Section(Constants.apparenceString)
                {
                    Picker(Constants.themeString, selection: $appTheme){
                        Text("System").tag(0)
                        Text("Light").tag(1)
                        Text("Dark").tag(2)
                    }
                }
            }.navigationTitle(Constants.setingsString)
        }
        
        
    }
}

#Preview {
    SettingsView()
}
