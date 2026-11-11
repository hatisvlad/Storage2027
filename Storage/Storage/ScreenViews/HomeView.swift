//
//  HomeView.swift
//  Storage
//
//  Created by Hatis Vlad Gabriel  on 02/05/2026.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Binding var selectedTab: Int
    @Query var items :[InventoryItem]
    @Environment(\.modelContext) private var modelContext
    @AppStorage("username") var userName : String = "User"
    var body: some View {
        
        NavigationStack{
            VStack{
                HStack{ Text("Hello, \(userName)!")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    // .border(.blue)
                    
                    Spacer()
                    
                    
                    Button{ withAnimation{selectedTab=2}
                    }
                    label:{ Image(systemName: Constants.addIcon)
                            .resizable()
                            .frame(width: 40,height: 40)
                        .foregroundStyle(Color.black)}
                    
                    .padding(20)
                    // .border(.blue)
                    
                }
                .padding(.top,10)
                Spacer()
                
                List
                    { ForEach(items) { item in
                        NavigationLink {
                            ItemDetaisView(item: item)
                        } label: {
                            
                            VStack (alignment: .leading,spacing: 4){
                                
                                HStack{
                                    Text("Quantity: \(item.quantity ?? 1)")
                                        .frame(width: 60, alignment: .leading)
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
                    .onDelete(perform: deleteItems)
                        
                    }
                    .listStyle(.plain)
                    
                }
             
            }
        }
        
    
    func deleteItems(offset:IndexSet){
        for index in offset{
            let itemToDelete = items[index]
            modelContext.delete(itemToDelete)
        }
    }
    
}

#Preview {
    HomeView(selectedTab: .constant(0))
}
