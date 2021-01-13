//
//  Storyboard.swift
//  ToolKit
//
//  Created by Санжар Дауылов on 19.03.2020.
//  Copyright © 2020 D. Sanzhar. All rights reserved.
//

import UIKit
import Foundation

protocol Storyboardable: class {
    static var storyboardName: String { get }
}

extension Storyboardable where Self: UIViewController {
    static var storyboardName: String {
        return String(describing: self)
    }

//    static func storyboardViewController<T: UIViewController>() -> T {
//        let storyboard = UIStoryboard(name: T.storyboardName, bundle: nil)
//        guard let viewController = storyboard.instantiateInitialViewController() as? T else {
//            fatalError("Could not instantiate initial storyboard with name: \(T.storyboardName)")
//        }
//
//        return viewController
//    }
}
