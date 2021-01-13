//
//  ConstraintsEdgeInsets.swift
//  ZAAZ Live
//
//  Created by Санжар Дауылов on 8/11/20.
//  Copyright © 2020 DAR. All rights reserved.
//

import UIKit

extension DAREdgeInsets {
    
    public static func uniform(_ value: CGFloat) -> DAREdgeInsets {
        return DAREdgeInsets(top: value, left: value, bottom: value, right: value)
    }
    
    public static func top(_ value: CGFloat) -> DAREdgeInsets {
        return DAREdgeInsets(top: value, left: 0, bottom: 0, right: 0)
    }
    
    public static func left(_ value: CGFloat) -> DAREdgeInsets {
        return DAREdgeInsets(top: 0, left: value, bottom: 0, right: 0)
    }
    
    public static func bottom(_ value: CGFloat) -> DAREdgeInsets {
        return DAREdgeInsets(top: 0, left: 0, bottom: value, right: 0)
    }
    
    public static func right(_ value: CGFloat) -> DAREdgeInsets {
        return DAREdgeInsets(top: 0, left: 0, bottom: 0, right: value)
    }
    
    public static func horizontal(_ value: CGFloat) -> DAREdgeInsets {
        return DAREdgeInsets(top: 0, left: value, bottom: 0, right: value)
    }
    
    public static func vertical(_ value: CGFloat) -> DAREdgeInsets {
        return DAREdgeInsets(top: value, left: 0, bottom: value, right: 0)
    }
}

public func + (lhs: DAREdgeInsets, rhs: DAREdgeInsets) -> DAREdgeInsets {
    return .init(top: lhs.top + rhs.top, left: lhs.left + rhs.left, bottom: lhs.bottom + rhs.bottom, right: lhs.right + rhs.right)
}
