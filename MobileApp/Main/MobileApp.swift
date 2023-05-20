//
//  MobileApp.swift
//  MobileApp
//
//  Created by Bibin Jaimon on 18/05/23.
//

import SwiftUI
import UIKit

@main
struct MobileApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    @StateObject private var store = RootStore.shared
    
    var body: some Scene {
        WindowGroup {
            Group {
                RootViewContainer()
                    .environmentObject(store)
            }
            .onShakeGesture {
                #if DEBUG
                store.showDebugger.toggle()
                #endif
            }
        }
    }
}

struct ShakeGestureViewModifier: ViewModifier {
    let action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.deviceDidShake)) { _ in
                action()
            }
    }
}

extension View {
    public func onShakeGesture(perform action: @escaping () -> Void) -> some View {
        self.modifier(ShakeGestureViewModifier(action: action))
    }
}
