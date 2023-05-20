//
//  Fetcher.swift
//  RetailApp
//
//  Created by Bibin Jaimon on 18/05/23.
//

import Foundation
import UIKit

final class Fetcher {
    
    static func installedBuildDetails() -> [DebugData] {
        var data = [DebugData]()
        let device = UIDevice.current
        let deviceName = device.name
        let systemName = device.systemName
        let systemVersion = device.systemVersion
        
        if let buildNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String {
            data.append(DebugData(key: "Build", value: buildNumber))
        }
        
        if let versionNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String {
            data.append(DebugData(key: "Version", value: versionNumber))
        }
        
        if let bundleIdentifier = Bundle.main.bundleIdentifier {
            data.append(DebugData(key: "Bundle Identifier", value: bundleIdentifier))
        }
        
        if let appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String {
            data.append(DebugData(key: "App Name", value: appName))
        }
        
        data.append(DebugData(key: "Device", value: "\(deviceName), \(systemName), \(systemVersion)"))
        return data.sorted{ $0.key < $1.key }
        
    }
    
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
        
        return allData
            .map { key, value in
                DebugData(key: key, value: String(describing: value))
            }
            .sorted{ $0.key < $1.key }
    }
}
