//
//  RetailAppApp.swift
//  RetailApp
//
//  Created by Bibin Jaimon on 18/05/23.
//

import SwiftUI

@main
struct RetailAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
