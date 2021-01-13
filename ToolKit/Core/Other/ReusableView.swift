//
//  ReusableView.swift
//  ToolKit
//
//  Created by Санжар Дауылов on 7/3/20.
//  Copyright © 2020 D. Sanzhar. All rights reserved.
//

import UIKit

public protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        if let defaultReuseIdentifier = NSStringFromClass(self).components(separatedBy: ".").last {
            return defaultReuseIdentifier
        }
        fatalError("Couldn't get defaultReuseIdentifier")
    }
}

public protocol NibLoadableView: class {
    static var nibName: String { get }
}

public extension NibLoadableView where Self: UIView {
    static var nibName: String {
        if let nibName = String(describing: self).components(separatedBy: ".").last {
            return nibName
        }
        fatalError("Couldn't get nibName")
    }
    
    static func instantiate() -> Self {
        if let nib = Bundle.main.loadNibNamed(nibName, owner: self, options: nil)?.first as? Self {
            return nib
        }
        fatalError("Couldn't get nib")
    }
}


