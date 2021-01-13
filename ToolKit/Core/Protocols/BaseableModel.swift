//
//  BaseableModel.swift
//  ToolKit
//
//  Created by Sanzhar Dauylov on 08.01.2021.
//  Copyright © 2021 D. Sanzhar. All rights reserved.
//

import Foundation

typealias JSON = [String: Any]
typealias BaseableModel = (Codable & BaseJSONModel)

protocol BaseJSONModel {
    func toJSON() -> JSON
}

extension BaseJSONModel where Self: Codable {
    func toJSON() -> JSON {
        let jsonData = (try? JSONEncoder().encode(self)) ?? Data()
        guard let json = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any]
            else { return [:] }
        return json
    }
}
