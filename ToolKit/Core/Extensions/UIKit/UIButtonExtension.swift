//
//  UIButton.swift
//  ToolKit
//
//  Created by Санжар Дауылов on 7/13/20.
//  Copyright © 2020 D. Sanzhar. All rights reserved.
//

import UIKit

extension UIButton {
    func setAttirbuted(title: String, color: UIColor, lineHeight: CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = lineHeight
        let attributedText = NSMutableAttributedString(
            string: title,
            attributes: [.paragraphStyle: paragraphStyle,
                         .foregroundColor: color]
        )
        self.setAttributedTitle(attributedText, for: .normal)
    }
}
