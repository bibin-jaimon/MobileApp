//
//  Fetcher.swift
//  RetailApp
//
//  Created by Bibin Jaimon on 18/05/23.
//

import Foundation

final class Fetcher {
    static func getInfoDict() -> [DebugData] {
        var data = [DebugData]()
        
        if let allData = Bundle.main.infoDictionary {
            data = allData.map { key, value in
                DebugData(key: key, value: String(describing: value))
            }
        }
                
        return data.sorted{ $0.key < $1.key }
    }
    
    static func getAllUserDefaultsData() -> [DebugData] {
        let allData = UserDefaults.standard.dictionaryRepresentation()
        
        return allData.map { key, value in
            DebugData(key: key, value: String(describing: value))
        }.sorted{ $0.key < $1.key }
    }
}
