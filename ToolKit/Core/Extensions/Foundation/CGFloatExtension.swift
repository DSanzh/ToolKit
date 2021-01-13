//
//  CGFloatExtension.swift
//  ToolKit
//
//  Created by Санжар Дауылов on 7/3/20.
//  Copyright © 2020 D. Sanzhar. All rights reserved.
//

import UIKit

extension CGFloat {
    static func * (lhs: CGFloat, rhs: Int) -> CGFloat {
        return lhs * CGFloat(rhs)
    }
    static func * (lhs: Int, rhs: CGFloat) -> CGFloat {
        return CGFloat(lhs) * rhs
    }
    public var adjustedWidth: CGFloat {
        return CGFloat(self) * Layouts.Screen.widthProportion
    }
    
    public var adjustedHeight: CGFloat {
        return CGFloat(self) * Layouts.Screen.heightProportion
    }
}
