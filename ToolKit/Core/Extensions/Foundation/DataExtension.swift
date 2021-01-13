//
//  NSData.swift
//  ToolKit
//
//  Created by Санжар Дауылов on 7/15/20.
//  Copyright © 2020 D. Sanzhar. All rights reserved.
//

import Foundation

extension Data {
    /// Serialize data to JSON and print it
    func printAsJSON() {
        do {
            // make sure this JSON is in the format we expect
            if let json = try JSONSerialization.jsonObject(with: self, options: []) as? [String: Any] {
                // try to read out a string array
                print("Dictionary = ", json)
            } else if let json = try JSONSerialization.jsonObject(with: self, options: []) as? [[String: Any]] {
                print("Array of Dictionary = ", json)
            } else {
                print("Cound't parse data")
            }
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }
    }
}
