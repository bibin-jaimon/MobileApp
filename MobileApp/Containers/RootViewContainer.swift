//
//  RootView.swift
//  MobileApp
//
//  Created by Bibin Jaimon on 20/05/23.
//

import SwiftUI

struct RootViewContainer: View {
    @EnvironmentObject var store: RootStore
    
    var body: some View {
        Group {
            LoginViewContainer()
        }
        .sheet(isPresented: $store.showDebugger) {
            DebuggerViewContainer()
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootViewContainer()
            .environmentObject(RootStore.shared)
    }
}
