//
//  Constraints+Superview.swift
//  ZAAZ Live
//
//  Created by Санжар Дауылов on 8/11/20.
//  Copyright © 2020 D. Sanzhar. All rights reserved.
//

import UIKit

public extension View {
    
    @available(iOS 10.0, *)
    @discardableResult
    func edgesToSuperview(excluding excludedEdge: LayoutEdge = .none, insets: TKEdgeInsets = .zero, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, usingSafeArea: Bool = false) -> Constraints {
        var constraints = Constraints()
        
        if !excludedEdge.contains(.top) {
            constraints.append(topToSuperview(offset: insets.top, relation: relation, priority: priority, isActive: isActive, usingSafeArea: usingSafeArea))
        }
        
        if effectiveUserInterfaceLayoutDirection == .leftToRight {
            
            if !(excludedEdge.contains(.leading) || excludedEdge.contains(.left)) {
                constraints.append(leftToSuperview(offset: insets.left, relation: relation, priority: priority, isActive: isActive, usingSafeArea: usingSafeArea))
            }
            
            if !(excludedEdge.contains(.trailing) || excludedEdge.contains(.right)) {
                constraints.append(rightToSuperview(offset: -insets.right, relation: relation, priority: priority, isActive: isActive, usingSafeArea: usingSafeArea))
            }
        } else {
            
            if !(excludedEdge.contains(.leading) || excludedEdge.contains(.right)) {
                constraints.append(rightToSuperview(offset: -insets.right, relation: relation, priority: priority, isActive: isActive, usingSafeArea: usingSafeArea))
            }
            
            if !(excludedEdge.contains(.trailing) || excludedEdge.contains(.left)) {
                constraints.append(leftToSuperview(offset: insets.left, relation: relation, priority: priority, isActive: isActive, usingSafeArea: usingSafeArea))
            }
        }
        
        if !excludedEdge.contains(.bottom) {
            constraints.append(bottomToSuperview(offset: -insets.bottom, relation: relation, priority: priority, isActive: isActive, usingSafeArea: usingSafeArea))
        }
        
        return constraints
    }
    
    @available(iOS 10.0, *)
    @discardableResult
    func leadingToSuperview( _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, usingSafeArea: Bool = false) -> Constraint {
        let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
        
        if effectiveUserInterfaceLayoutDirection == .rightToLeft {
            return leading(to: constrainable, anchor, offset: -offset, relation: relation, priority: priority, isActive: isActive)
        } else {
            return leading(to: constrainable, anchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
        }
    }
    
    @available(iOS 10.0, *)
    @discardableResult
    func trailingToSuperview( _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, usingSafeArea: Bool = false) -> Constraint {
        let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
        
        if effectiveUserInterfaceLayoutDirection == .rightToLeft {
            return trailing(to: constrainable, anchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
        } else {
            return trailing(to: constrainable, anchor, offset: -offset, relation: relation, priority: priority, isActive: isActive)
        }
    }
    
    @available(iOS 10.0, *)
    @discardableResult
    func horizontalToSuperview(insets: TKEdgeInsets = .zero, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, usingSafeArea: Bool = false) -> Constraints {
        
        var constraints = Constraints()
        
        if effectiveUserInterfaceLayoutDirection == .leftToRight {
            constraints.append(leftToSuperview(offset: insets.left, relation: relation, priority: priority, isActive: isActive, usingSafeArea: usingSafeArea))
            constraints.append(rightToSuperview(offset: -insets.right, relation: relation, priority: priority, isActive: isActive, usingSafeArea: usingSafeArea))
        } else {
            constraints.append(rightToSuperview(offset: -insets.right, relation: relation, priority: priority, isActive: isActive, usingSafeArea: usingSafeArea))
            constraints.append(leftToSuperview(offset: insets.left, relation: relation, priority: priority, isActive: isActive, usingSafeArea: usingSafeArea))
        }
        
        return constraints
    }
    
    @available(iOS 10.0, *)
    @discardableResult
    func verticalToSuperview(insets: TKEdgeInsets = .zero, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, usingSafeArea: Bool = false) -> Constraints {
        
        let constraints = Constraints(arrayLiteral:
            topToSuperview(offset: insets.top, relation: relation, priority: priority, isActive: isActive, usingSafeArea: usingSafeArea),
            bottomToSuperview(offset: -insets.bottom, relation: relation, priority: priority, isActive: isActive, usingSafeArea: usingSafeArea)
        )
        return constraints
    }
}

public struct LayoutEdge: OptionSet {
    public let rawValue: UInt8
    public init(rawValue: UInt8) {
        self.rawValue = rawValue
    }
    public static let top = LayoutEdge(rawValue: 1 << 0)
    public static let bottom = LayoutEdge(rawValue: 1 << 1)
    public static let trailing = LayoutEdge(rawValue: 1 << 2)
    public static let leading = LayoutEdge(rawValue: 1 << 3)
    public static let left = LayoutEdge(rawValue: 1 << 4)
    public static let right = LayoutEdge(rawValue: 1 << 5)
    public static let none = LayoutEdge(rawValue: 1 << 6)
}

public extension View {
    
    private func safeConstrainable(for superview: View?, usingSafeArea: Bool) -> Constrainable {
        guard let superview = superview else {
            fatalError("Unable to create this constraint to it's superview, because it has no superview.")
        }
        
        prepareForLayout()
        
        if #available(iOS 11, *) {
            if usingSafeArea {
                return superview.safeAreaLayoutGuide
            }
        }
        
        return superview
    }
    
    @discardableResult
    func centerInSuperview(offset: CGPoint = .zero, priority: LayoutPriority = .required, isActive: Bool = true, usingSafeArea: Bool = false) -> Constraints {
        let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
        return center(in: constrainable, offset: offset, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    func originToSuperview(insets: TKEdgeInsets = .zero, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, usingSafeArea: Bool = false) -> Constraints {
        let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
        return origin(to: constrainable, insets: insets, relation: relation, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    func widthToSuperview( _ dimension: NSLayoutDimension? = nil, multiplier: CGFloat = 1, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, usingSafeArea: Bool = false) -> Constraint {
        let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
        return width(to: constrainable, dimension, multiplier: multiplier, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    func heightToSuperview( _ dimension: NSLayoutDimension? = nil, multiplier: CGFloat = 1, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, usingSafeArea: Bool = false) -> Constraint {
        let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
        return height(to: constrainable, dimension, multiplier: multiplier, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    func leftToSuperview( _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, usingSafeArea: Bool = false) -> Constraint {
        let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
        return left(to: constrainable, anchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    func rightToSuperview( _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, usingSafeArea: Bool = false) -> Constraint {
        let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
        return right(to: constrainable, anchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    func topToSuperview( _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, usingSafeArea: Bool = false) -> Constraint {
        let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
        return top(to: constrainable, anchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    func bottomToSuperview( _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, usingSafeArea: Bool = false) -> Constraint {
        let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
        return bottom(to: constrainable, anchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    func centerXToSuperview( _ anchor: NSLayoutXAxisAnchor? = nil, multiplier: CGFloat = 1, offset: CGFloat = 0, priority: LayoutPriority = .required, isActive: Bool = true, usingSafeArea: Bool = false) -> Constraint {
        let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
        return centerX(to: constrainable, anchor, multiplier: multiplier, offset: offset, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    func centerYToSuperview( _ anchor: NSLayoutYAxisAnchor? = nil, multiplier: CGFloat = 1, offset: CGFloat = 0, priority: LayoutPriority = .required, isActive: Bool = true, usingSafeArea: Bool = false) -> Constraint {
        let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
        return centerY(to: constrainable, anchor, multiplier: multiplier, offset: offset, priority: priority, isActive: isActive)
    }
}
