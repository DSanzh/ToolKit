//
//  UIEdgeInsetsExtension.swift
//  ToolKit
//
//  Created by Санжар Дауылов on 7/3/20.
//  Copyright © 2020 D. Sanzhar. All rights reserved.
//

import UIKit

extension UIEdgeInsets {
    
    /// Инициализирует структуру с попарно одинаковыми отсутапми, сверху и снизу равными высоте, слева и справа — ширине
    ///
    /// - Parameter size: высота и ширина отступов
    init(_ size: CGSize) {
        self.init(top: size.height, left: size.width, bottom: size.height, right: size.width)
    }
    
    /// Умножает все элементы структуры на множитель
    ///
    /// - Parameters:
    ///   - lhs: исходная структура UIEdgeInsets
    ///   - rhs: множитель
    /// - Returns: результат умножения всех элементов на множитель
    static func * (lhs: UIEdgeInsets, rhs: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: lhs.top * rhs, left: lhs.left * rhs, bottom: lhs.bottom * rhs, right: lhs.right * rhs)
    }
}
