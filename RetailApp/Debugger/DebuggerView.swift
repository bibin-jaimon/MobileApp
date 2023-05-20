//
//  DebuggerView.swift
//  RetailApp
//
//  Created by Bibin Jaimon on 18/05/23.
//

import SwiftUI

enum DebugPanelList: String {
    case about = "Info Plist"
    case userDefault = "UserDefault"
    case buildInfo = "Build Info"
}


struct DebugData: Identifiable {
    let id: UUID = UUID()
    let key: String
    let value: String
}


struct DebuggerViewContainer: View {
    private var dataSource: [DebugPanelList] = [
        .buildInfo,
        .about,
        .userDefault
    ]
    
    var body: some View {
        NavigationView {
            List(dataSource, id: \.self) { item in
                NavigationLink(item.rawValue) {
                    switch item {
                    case .buildInfo: DetailView(title: item.rawValue, debugData: Fetcher.installedBuildDetails())
                    case .about: DetailView(title: item.rawValue, debugData: Fetcher.getInfoDict())
                    case .userDefault: DetailView(title: item.rawValue, debugData: Fetcher.getAllUserDefaultsData())
                    }
                }
            }
            .navigationTitle("Debugger")
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

struct DebuggerViewContainer_Previews: PreviewProvider {
    static var previews: some View {
        DebuggerViewContainer()
    }
}
