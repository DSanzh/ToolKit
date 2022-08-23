//
//  Typography.swift
//  ZAAZ Live
//
//  Created by Санжар Дауылов on 9/3/20.
//  Copyright © 2020 DAR. All rights reserved.
//

import UIKit

public protocol StyledTextProtocol {
    var styledText: NSAttributedString { get }
}

public enum Typography: StyledTextProtocol {
    /// Bold.font(size: 34)
    case titleFirst(string: String, color: UIColor, aligment: NSTextAlignment)
    /// Bold.font(size: 28)
    case titleSecond(string: String, color: UIColor, aligment: NSTextAlignment)
    /// Bold.font(size: 25)
    case titleThrid(string: String, color: UIColor, aligment: NSTextAlignment)
    /// Bold.font(size: 20)
    case titleFourth(string: String, color: UIColor, aligment: NSTextAlignment)
    /// Semibold.font(size: 17)
    case headline(string: String, color: UIColor, aligment: NSTextAlignment)
    /// Regular.font(size: 17)
    case body(string: String, color: UIColor, aligment: NSTextAlignment)
    /// Regular.font(size: 16)
    case callout(string: String, color: UIColor, aligment: NSTextAlignment)
    /// Regular.font(size: 15)
    case subheadFirst(string: String, color: UIColor, aligment: NSTextAlignment)
    /// Semibold.font(size: 15)
    case subheadSecond(string: String, color: UIColor, aligment: NSTextAlignment)
    /// Regular.font(size: 13)
    case footnoteFirst(string: String, color: UIColor, aligment: NSTextAlignment)
    /// Semibold.font(size: 13)
    case footnoteSecond(string: String, color: UIColor, aligment: NSTextAlignment)
    /// Regular.font(size: 12)
    case captionFirst(string: String, color: UIColor, aligment: NSTextAlignment)
    /// Semibold.font(size: 11)
    case captionSecond(string: String, color: UIColor, aligment: NSTextAlignment)
    
    public var styledText: NSAttributedString {
        switch self {
        case let .titleFirst(text, color, aligment):
            return NSAttributedString(text,
                                      color: color,
                                      font: Font.titleFirst(size: 34).font,
                                      alignment: aligment,
                                      lineSpacing: 0.41, letterSpacing: 0.41, lineBreakMode: nil)
        case let .titleSecond(text, color, aligment):
            return NSAttributedString(text,
                                      color: color,
                                      font: Font.titleSecond(size: 28).font,
                                      alignment: aligment,
                                      lineSpacing: 0.34, letterSpacing: 0.36, lineBreakMode: nil)
        case let .titleThrid(text, color, aligment):
            return NSAttributedString(text,
                                      color: color,
                                      font: Font.titleThrid(size: 25).font,
                                      alignment: aligment,
                                      lineSpacing: 0.36, letterSpacing: 0.25, lineBreakMode: nil)
        case let .titleFourth(text, color, aligment):
            return NSAttributedString(text,
                                      color: color,
                                      font: Font.titleFourth(size: 20).font,
                                      alignment: aligment,
                                      lineSpacing: 0.38, letterSpacing: 0.24, lineBreakMode: nil)
        case let .headline(text, color, aligment):
            return NSAttributedString(text,
                                      color: color,
                                      font: Font.headline(size: 17).font,
                                      alignment: aligment,
                                      lineSpacing: 0.22, letterSpacing: -0.41, lineBreakMode: nil)
        case let .body(text, color, aligment):
            return NSAttributedString(text,
                                      color: color,
                                      font: Font.body(size: 17).font,
                                      alignment: aligment,
                                      lineSpacing: 0.22, letterSpacing: -0.41, lineBreakMode: nil)
        case let .callout(text, color, aligment):
            return NSAttributedString(text,
                                      color: color,
                                      font: Font.callout(size: 16).font,
                                      alignment: aligment,
                                      lineSpacing: 0.21, letterSpacing: -0.3, lineBreakMode: nil)
        case let .subheadFirst(text, color, aligment):
            return NSAttributedString(text,
                                      color: color,
                                      font: Font.subheadFirst(size: 15).font,
                                      alignment: aligment,
                                      lineSpacing: 0.20, letterSpacing: -0.24, lineBreakMode: nil)
        case let .subheadSecond(text, color, aligment):
            return NSAttributedString(text,
                                      color: color,
                                      font: Font.subheadSecond(size: 15).font,
                                      alignment: aligment,
                                      lineSpacing: 0.20, letterSpacing: -0.09, lineHeight: 22, lineBreakMode: nil)
        case let .footnoteFirst(text, color, aligment):
            return NSAttributedString(text,
                                      color: color,
                                      font: Font.footnoteFirst(size: 13).font,
                                      alignment: aligment,
                                      lineSpacing: 0.18, letterSpacing: -0.08, lineHeight: 18, lineBreakMode: nil)
        case let .footnoteSecond(text, color, aligment):
            return NSAttributedString(text,
                                      color: color,
                                      font: Font.footnoteSecond(size: 13).font,
                                      alignment: aligment,
                                      lineSpacing: 0.18, letterSpacing: -0.08, lineHeight: 18, lineBreakMode: nil)
        case let .captionFirst(text, color, aligment):
            return NSAttributedString(text,
                                      color: color,
                                      font: Font.captionFirst(size: 12).font,
                                      alignment: aligment,
                                      lineSpacing: 0.16, letterSpacing: 0.0, lineHeight: 16, lineBreakMode: nil)
        case let .captionSecond(text, color, aligment):
            return NSAttributedString(text,
                                      color: color,
                                      font: Font.captionSecond(size: 11).font,
                                      alignment: aligment,
                                      lineSpacing: 0.07, letterSpacing: 0.13, lineBreakMode: nil)
        }
    }
}


extension NSAttributedString {
    convenience init(_ string: String,
                     color: UIColor = .black,
                     font: UIFont = Font.body(size: 14).font,
                     alignment: NSTextAlignment = .left,
                     lineSpacing: CGFloat?,
                     letterSpacing: CGFloat?,
                     lineHeight: CGFloat? = nil,
                     lineBreakMode _: NSLineBreakMode? = nil) {
        let paragraphStyle = NSMutableParagraphStyle()
        
        if let lineSpacing = lineSpacing {
            paragraphStyle.lineSpacing = lineSpacing
        }
        if let lineHeight = lineHeight {
            paragraphStyle.minimumLineHeight = lineHeight
//            paragraphStyle.lineHeightMultiple = lineHeight
            paragraphStyle.maximumLineHeight = lineHeight
        }
        paragraphStyle.alignment = alignment
        paragraphStyle.lineBreakMode = .byTruncatingTail
        var attrs: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: color,
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
            NSAttributedString.Key.font: font,
        ]
        if let letterSpacing = letterSpacing {
            attrs[NSAttributedString.Key.kern] = letterSpacing
        }
        self.init(string: string, attributes: attrs)
    }
}

