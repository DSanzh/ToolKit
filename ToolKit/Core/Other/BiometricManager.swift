//
//  BiometricManager.swift
//  ToolKit
//
//  Created by Sanzhar Dauylov on 08.11.2021.
//  Copyright © 2021 D. Sanzhar. All rights reserved.
//

import Foundation
import LocalAuthentication

class BiometricManager {
    
    private static let key = "IsBiometryEnabled"
    
    static public func wasSet() -> Bool? {
        return UserDefaults.standard.bool(forKey: key)
    }
    
    static public func isOn() -> Bool {
        return UserDefaults.standard.bool(forKey: BiometricManager.key)
    }
    
    static public func turnOn() {
        UserDefaults.standard.set(true, forKey: BiometricManager.key)
    }
    
    static public func turnOff() {
        UserDefaults.standard.set(false, forKey: BiometricManager.key)
    }
    
    static func localAuthentication(_ onSuccess: @escaping () -> Void) -> Void {
        
        let laContext = LAContext()
        var error: NSError?
        let biometricsPolicy = LAPolicy.deviceOwnerAuthenticationWithBiometrics
        
        if laContext.canEvaluatePolicy(biometricsPolicy, error: &error) {
            guard error == nil else { return }
            
            var localizedReason = "Unlock device"
            if #available(iOS 11.0, *) {
                if laContext.biometryType == .faceID {
                    localizedReason = "face id"
                } else if laContext.biometryType == .touchID {
                    localizedReason = "touch id"
                }
            }
            
            laContext.evaluatePolicy(biometricsPolicy, localizedReason: localizedReason, reply: { (isSuccess, error) in
                DispatchQueue.main.async {
                    guard error == nil, isSuccess else { return}
                    onSuccess()
                }
            })
        }
    }

    static public func isTouchIdAvailable() -> Bool {
        return biometricType() == .touch
    }

    static public func isFaceIdAvailable() -> Bool {
        return biometricType() == .face
    }

    static public func isTouchOrFaceIdAvailable() -> Bool {
        if isTouchIdAvailable() || isFaceIdAvailable() {
            return true
        } else {
            return false
        }
    }
    
    private static func biometricType() -> BiometricType {
        let authContext = LAContext()
        if #available(iOS 11, *) {
            let _ = authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
            switch authContext.biometryType {
            case .touchID:
                return .touch
            case .faceID:
                return .face
            default:
                return .none
            }
        } else {
            return authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) ? .touch : .none
        }
    }

    private enum BiometricType {
        case none
        case touch
        case face
    }
}
