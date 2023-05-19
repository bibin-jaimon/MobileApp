//
//  ContentView.swift
//  RetailApp
//
//  Created by Bibin Jaimon on 18/05/23.
//

import SwiftUI

enum DebugPanelList: String {
    case about = "Info Plist"
    case userDefault = "UserDefault"
}

struct ContentView: View {
    
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
    var dataSource: [DebugPanelList] = [
        .about,
        .userDefault
    ]
    
    var body: some View {
        NavigationView {
            // Step 2: Create a List view
            List(dataSource, id: \.self) { item in
                NavigationLink(item.rawValue) {
                    switch item {
                    case .about: DetailView(title: item.rawValue, debugData: Fetcher.getInfoDict())
                    case .userDefault: DetailView(title: item.rawValue, debugData: Fetcher.getAllUserDefaultsData())
                    }
                    
                }
            }
            .navigationTitle("Debug Panel")
        }
        .onAppear {
            isOnboarding.toggle()
        }
    }
}

struct DetailView: View {
    let title: String
    let debugData: [DebugData]
    
    var body: some View {
        List(debugData) { data in
            
            VStack(alignment: .leading) {
                Text(data.key)
                    .font(.system(size: 18))
                Text(data.value)
                    .font(.footnote)
            }
            
                
        }
        .listStyle(.plain)
        .navigationBarTitle(title)
        
    }
}


extension ContentView {
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DebugData: Identifiable {
    let id: UUID = UUID()
    let key: String
    let value: String
}
