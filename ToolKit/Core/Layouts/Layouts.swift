//
//  Layouts.swift
//  DMS
//
//  Created by Санжар Дауылов on 7/12/20.
//  Copyright © 2020 D. Sanzhar. All rights reserved.
//

import UIKit

enum Layouts {
    /// Size: 4
    case xxxs
    /// Size: 8
    case xxs
    /// Size: 12
    case xs
    /// Size: 16
    case small
    /// Size: 20
    case medium
    /// Size: 24
    case large
    /// Size: 36
    case xl
    /// Size: 48
    case xxl
    /// Size: 60
    case xxxl
    /// Size: 72
    case xxxxl
    
    var offset: UIOffset {
        return UIOffset(mininumSize * multipliers)
    }
    var size: CGSize {
        return mininumSize * multipliers
    }
    var space: CGFloat {
        return mininumSize.height * multipliers
    }
    var insets: UIEdgeInsets {
        return UIEdgeInsets(mininumSize) * multipliers
    }
    var frame: CGRect {
        return CGRect(x: 0, y: 0, width: size.width, height: size.height)
    }
    /// Значение минимального размера сетки по умолчанию
    var mininumSize: CGSize { return CGSize(4.0) }
    
    var multipliers: CGFloat {
        switch self {
        case .xxxs:
            return 1
        case .xxs:
            return 2
        case .xs:
            return 3
        case .small:
            return 4
        case .medium:
            return 5
        case .large:
            return 6
        case .xl:
            return 9
        case .xxl:
            return 12
        case .xxxl:
            return 15
        case .xxxxl:
            return 18
        }
    }
    struct Screen {
        public static let bounds = UIScreen.main.bounds
        public static let size = UIScreen.main.bounds.size
        public static let width = bounds.width
        public static let height = bounds.height
        public static let widthProportion = Screen.width / 1194
        public static let heightProportion = Screen.height / 834
    }
}
