//
//  NSObject.swift
//  ToolKit
//
//  Created by Санжар Дауылов on 25.03.2020.
//  Copyright © 2020 D. Sanzhar. All rights reserved.
//

import Foundation

extension NSObject {
    static var stringFromClass: String { return NSStringFromClass(self) }
    var stringFromClass: String { return NSStringFromClass(type(of: self)) }
    static var className: String { return self.stringFromClass.components(separatedBy: ".").last! }
    var className: String { return self.stringFromClass.components(separatedBy: ".").last! }
}
