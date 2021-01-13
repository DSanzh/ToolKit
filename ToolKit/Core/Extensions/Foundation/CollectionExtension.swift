//
//  Collection.swift
//  ToolKit
//
//  Created by Sanzhar Dauylov on 08.01.2021.
//  Copyright © 2021 D. Sanzhar. All rights reserved.
//

import Foundation

extension Collection {

    /// Returns the element at the specified index iff it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
