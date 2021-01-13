//
//  Button+Extensions.swift
//  ToolKit
//
//  Created by Санжар Дауылов on 01.04.2020.
//  Copyright © 2020 D. Sanzhar. All rights reserved.
//

import UIKit

extension UIButton {
    func applyGradient(colors: [CGColor]) -> CALayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)

        return gradientLayer
    }
}
