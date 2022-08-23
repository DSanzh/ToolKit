//
//  NSAttributedStringExtensions.swift
//  ToolKit
//
//  Created by Sanzhar Dauylov on 08.01.2021.
//  Copyright © 2021 D. Sanzhar. All rights reserved.
//

import UIKit

extension NSAttributedString {
    struct AttributesConfig {
        var font: UIFont?
        var textColor: UIColor?
    }
    struct ParagraphConfig {
        var lineHeight: CGFloat?
        var lineSpacing: CGFloat?
    }
    convenience init(with text: String,
                     attributesConfig: AttributesConfig,
                     paragraphConfig: ParagraphConfig) {
        
        let paragraph: NSMutableParagraphStyle = NSMutableParagraphStyle()
        if let lineSpacing = paragraphConfig.lineSpacing { paragraph.lineSpacing = lineSpacing }
        if let lineHeight = paragraphConfig.lineHeight { paragraph.minimumLineHeight = lineHeight }
        
        var attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.paragraphStyle: paragraph]
        
        if let font = attributesConfig.font { attributes[NSAttributedString.Key.font] = font }
        if let textColor = attributesConfig.textColor { attributes[NSAttributedString.Key.foregroundColor] = textColor }
        
        self.init(string: text, attributes: attributes)
    }
    
    
    func heightForWidth(_ width: CGFloat) -> CGFloat {
        return ceil(boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude),
                                 options: [.usesLineFragmentOrigin, .usesFontLeading],
                                 context: nil).size.height)
    }
    
    func widthForHeight(_ height: CGFloat) -> CGFloat {
        return ceil(boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: height),
                                 options: [.usesLineFragmentOrigin, .usesFontLeading],
                                 context: nil).size.width)
    }
}
