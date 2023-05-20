//
//  RootStore.swift
//  MobileApp
//
//  Created by Bibin Jaimon on 20/05/23.
//

import Foundation

class RootStore: ObservableObject {
    static var shared = RootStore()
    @Published var showDebugger: Bool = false
}
