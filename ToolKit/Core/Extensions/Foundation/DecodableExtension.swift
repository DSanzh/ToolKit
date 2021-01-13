//
//  Decodable.swift
//  ToolKit
//
//  Created by Sanzhar Dauylov on 08.01.2021.
//  Copyright © 2021 D. Sanzhar. All rights reserved.
//

import Foundation
import UIKit

extension Decodable {
    static func decode(with decoder: JSONDecoder = JSONDecoder(), from data: Data) throws -> Self? {
        do {
            let newdata = try decoder.decode(Self.self, from: data)
            return newdata
        } catch {
            return nil
        }
    }
}

extension KeyedDecodingContainer {
    func decodeWrapper<T>(key: K, defaultValue: T) throws -> T
        where T: Decodable {
            return try decodeIfPresent(T.self, forKey: key) ?? defaultValue
    }
}
