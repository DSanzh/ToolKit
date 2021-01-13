//
//  IntExtension.swift
//  ToolKit
//
//  Created by Санжар Дауылов on 7/3/20.
//  Copyright © 2020 D. Sanzhar. All rights reserved.
//

import UIKit

extension Int {
    public var adjustedWidth: CGFloat {
       return self * Layouts.Screen.widthProportion
   }
   
   public var adjustedHeight: CGFloat {
       return self * Layouts.Screen.heightProportion
   }
}
