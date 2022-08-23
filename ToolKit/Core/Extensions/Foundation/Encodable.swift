//
//  Encodable.swift
//  ToolKit
//
//  Created by Sanzhar Dauylov on 01.10.2021.
//  Copyright © 2021 D. Sanzhar. All rights reserved.
//

import Foundation

public extension Encodable {
    func dictionary(encodingStrategy: JSONEncoder.KeyEncodingStrategy = .useDefaultKeys, dateEncodingFormat: DateFormatter = DateFormatter()) -> [String: Any] {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = encodingStrategy
        encoder.dateEncodingStrategy = .formatted(dateEncodingFormat)
        let params = try? JSONSerialization.jsonObject(with: encoder.encode(self), options: .allowFragments) as? [String: Any]
        return params ?? [:]
    }
}
