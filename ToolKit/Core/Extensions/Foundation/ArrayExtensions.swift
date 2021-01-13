//
//  Array+Extensions.swift
//  ToolKit
//
//  Created by Санжар Дауылов on 30.04.2020.
//  Copyright © 2020 D. Sanzhar. All rights reserved.
//

import Foundation

extension Array {
    func split(forGroupOf groupVolume: Int) -> [[Element]] {
        guard let lastIndex = self.indices.last, lastIndex > 0 else { return [self] }
        var currentIndex = 0
        var separateSanzhay: [[Element]] = []
        while currentIndex < lastIndex + 1 {
            let newIndex = currentIndex + groupVolume > lastIndex ? lastIndex + 1 : currentIndex + groupVolume
            let slice = Array(self[currentIndex..<newIndex])
            separateSanzhay.append(slice)
            currentIndex = newIndex
        }
        return separateSanzhay
    }
}
