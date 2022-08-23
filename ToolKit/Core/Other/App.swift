//
//  App.swift
//  ToolKit
//
//  Created by Sanzhar Dauylov on 08.01.2021.
//  Copyright © 2021 D. Sanzhar. All rights reserved.
//

import Foundation

enum AppMode: String, CaseIterable {
    case prod
    case dev
}

struct App {
    
    private let SAVED_MODE = "SAVED_MODE"
    
    enum TARGETS: String {
        case prod = "Target Prod Name"
        case dev = "Target test name"
    }
    
    static var TARGET_NAME: TARGETS {
        return IS_TARGET_PROD ? .prod : .dev
    }
    
    static var mode: AppMode {
        
        guard TARGET_NAME == .dev else { return .prod }
        guard let savedMode = getSavedMode() else { return .prod }
        return savedMode
    }
    
    static func getSavedMode() -> AppMode? {
        guard let str = UserDefaults.standard.string(forKey: "SAVED_MODE"), let mode = AppMode(rawValue: str) else { return nil }
        return mode
    }
    
    static func saveMode(mode: AppMode) {
        UserDefaults.standard.setValue(mode.rawValue, forKey: "SAVED_MODE")
    }

    // MARK: Application version
    static var applicationVersion: String? {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? nil
        guard TARGET_NAME == .dev else { return version }
        guard let savedVersion = getSavedAppVersion() else { return version }
        return savedVersion
    }
    
    static func getSavedAppVersion() -> String? {
        guard let ver = UserDefaults.standard.string(forKey: "SAVED_APP_VERSION") else { return nil }
        return ver
    }
}

extension App {
    
    static let target = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? ""
    
    static public var IS_TARGET_PROD: Bool {
        if target == TARGETS.prod.rawValue {
            return true
        }
        return false
    }
}
