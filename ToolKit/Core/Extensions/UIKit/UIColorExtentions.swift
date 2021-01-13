//
//  Color+Extentions.swift
//  ToolKit
//
//  Created by Санжар Дауылов on 25.03.2020.
//  Copyright © 2020 D. Sanzhar. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(rgb: Int, alpha: CGFloat = 1) {
        let red = (rgb >> 16) & 0xFF
        let green = (rgb >> 8) & 0xFF
        let blue = (rgb >> 0) & 0xFF

        self.init(red: CGFloat(red) / 255.0,
                  green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
}
