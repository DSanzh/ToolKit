//
//  Constraints.swift
//  ZAAZ Live
//
//  Created by Санжар Дауылов on 8/11/20.
//  Copyright © 2020 DAR. All rights reserved.
//

import UIKit

public typealias Constraint = NSLayoutConstraint
public typealias Constraints = [Constraint]

public enum ConstraintRelation: Int {
    case equal = 0
    case equalOrLess = -1
    case equalOrGreater = 1
}

public extension Collection where Iterator.Element == Constraint {
    
    func activate() {
        
        if let constraints = self as? Constraints {
            Constraint.activate(constraints)
        }
    }
    
    func deActivate() {
        
        if let constraints = self as? Constraints {
            Constraint.deactivate(constraints)
        }
    }
}

public extension Constraint {
    @objc
    func with(_ p: LayoutPriority) -> Self {
        priority = p
        return self
    }
    
    func set(_ active: Bool) -> Self {
        isActive = active
        return self
    }
}
