//
//  Fonts.swift
//  ZAAZ Live
//
//  Created by Санжар Дауылов on 8/5/20.
//  Copyright © 2020 DAR. All rights reserved.
//

import UIKit

// MARK: - Fonts
// swiftlint:disable identifier_name line_length type_body_length
internal enum FontFamily {
    internal enum SFProDisplay {
        internal static let black = FontConvertible(name: "SFProDisplay-Black", family: "SF Pro Display", path: "SF-Pro-Display-Black.otf")
        internal static let blackItalic = FontConvertible(name: "SFProDisplay-BlackItalic", family: "SF Pro Display", path: "SF-Pro-Display-BlackItalic.otf")
        internal static let bold = FontConvertible(name: "SFProDisplay-Bold", family: "SF Pro Display", path: "SF-Pro-Display-Bold.otf")
        internal static let boldItalic = FontConvertible(name: "SFProDisplay-BoldItalic", family: "SF Pro Display", path: "SF-Pro-Display-BoldItalic.otf")
        internal static let heavy = FontConvertible(name: "SFProDisplay-Heavy", family: "SF Pro Display", path: "SF-Pro-Display-Heavy.otf")
        internal static let heavyItalic = FontConvertible(name: "SFProDisplay-HeavyItalic", family: "SF Pro Display", path: "SF-Pro-Display-HeavyItalic.otf")
        internal static let italic = FontConvertible(name: "SFProDisplay-Italic", family: "SF Pro Display", path: "SF-Pro-Display-RegularItalic.otf")
        internal static let light = FontConvertible(name: "SFProDisplay-Light", family: "SF Pro Display", path: "SF-Pro-Display-Light.otf")
        internal static let lightItalic = FontConvertible(name: "SFProDisplay-LightItalic", family: "SF Pro Display", path: "SF-Pro-Display-LightItalic.otf")
        internal static let medium = FontConvertible(name: "SFProDisplay-Medium", family: "SF Pro Display", path: "SF-Pro-Display-Medium.otf")
        internal static let mediumItalic = FontConvertible(name: "SFProDisplay-MediumItalic", family: "SF Pro Display", path: "SF-Pro-Display-MediumItalic.otf")
        internal static let regular = FontConvertible(name: "SFProDisplay-Regular", family: "SF Pro Display", path: "SF-Pro-Display-Regular.otf")
        internal static let semibold = FontConvertible(name: "SFProDisplay-Semibold", family: "SF Pro Display", path: "SF-Pro-Display-Semibold.otf")
        internal static let semiboldItalic = FontConvertible(name: "SFProDisplay-SemiboldItalic", family: "SF Pro Display", path: "SF-Pro-Display-SemiboldItalic.otf")
        internal static let thin = FontConvertible(name: "SFProDisplay-Thin", family: "SF Pro Display", path: "SF-Pro-Display-Thin.otf")
        internal static let thinItalic = FontConvertible(name: "SFProDisplay-ThinItalic", family: "SF Pro Display", path: "SF-Pro-Display-ThinItalic.otf")
        internal static let ultralight = FontConvertible(name: "SFProDisplay-Ultralight", family: "SF Pro Display", path: "SF-Pro-Display-Ultralight.otf")
        internal static let ultralightItalic = FontConvertible(name: "SFProDisplay-UltralightItalic", family: "SF Pro Display", path: "SF-Pro-Display-UltralightItalic.otf")
        internal static let all: [FontConvertible] = [black, blackItalic, bold, boldItalic, heavy, heavyItalic, italic, light, lightItalic, medium, mediumItalic, regular, semibold, semiboldItalic, thin, thinItalic, ultralight, ultralightItalic]
    }
    internal enum SFProText {
        internal static let bold = FontConvertible(name: "SFProText-Bold", family: "SF Pro Text", path: "SF-Pro-Text-Bold.otf")
        internal static let boldItalic = FontConvertible(name: "SFProText-BoldItalic", family: "SF Pro Text", path: "SF-Pro-Text-BoldItalic.otf")
        internal static let heavy = FontConvertible(name: "SFProText-Heavy", family: "SF Pro Text", path: "SF-Pro-Text-Heavy.otf")
        internal static let heavyItalic = FontConvertible(name: "SFProText-HeavyItalic", family: "SF Pro Text", path: "SF-Pro-Text-HeavyItalic.otf")
        internal static let italic = FontConvertible(name: "SFProText-Italic", family: "SF Pro Text", path: "SF-Pro-Text-RegularItalic.otf")
        internal static let light = FontConvertible(name: "SFProText-Light", family: "SF Pro Text", path: "SF-Pro-Text-Light.otf")
        internal static let lightItalic = FontConvertible(name: "SFProText-LightItalic", family: "SF Pro Text", path: "SF-Pro-Text-LightItalic.otf")
        internal static let medium = FontConvertible(name: "SFProText-Medium", family: "SF Pro Text", path: "SF-Pro-Text-Medium.otf")
        internal static let mediumItalic = FontConvertible(name: "SFProText-MediumItalic", family: "SF Pro Text", path: "SF-Pro-Text-MediumItalic.otf")
        internal static let regular = FontConvertible(name: "SFProText-Regular", family: "SF Pro Text", path: "SF-Pro-Text-Regular.otf")
        internal static let semibold = FontConvertible(name: "SFProText-Semibold", family: "SF Pro Text", path: "SF-Pro-Text-Semibold.otf")
        internal static let semiboldItalic = FontConvertible(name: "SFProText-SemiboldItalic", family: "SF Pro Text", path: "SF-Pro-Text-SemiboldItalic.otf")
        internal static let all: [FontConvertible] = [bold, boldItalic, heavy, heavyItalic, italic, light, lightItalic, medium, mediumItalic, regular, semibold, semiboldItalic]
    }
    internal static let allCustomFonts: [FontConvertible] = [SFProDisplay.all, SFProText.all].flatMap { $0 }
    internal static func registerAllCustomFonts() {
        allCustomFonts.forEach { $0.register() }
    }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

struct FontConvertible {
    internal let name: String
    internal let family: String
    internal let path: String
    
    internal func font(size: CGFloat) -> UIFont! {
        return UIFont(font: self, size: size)
    }
    
    internal func register() {
        // swiftlint:disable:next conditional_returns_on_newline
        guard let url = url else { return }
        CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
    }
    
    fileprivate var url: URL? {
        let bundle = Bundle(for: BundleToken.self)
        return bundle.url(forResource: path, withExtension: nil)
    }
}

extension UIFont {
    convenience init!(font: FontConvertible, size: CGFloat) {
        if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
            font.register()
        }
        self.init(name: font.name, size: size)
    }
}

private final class BundleToken {}

extension UIFont {
    /// SFProText.regular - 14
    class func `default`(_ size: CGFloat = 14) -> UIFont {
        return FontFamily.SFProText.regular.font(size: size)
    }
    /// SFProDisplay.bold - 34
    class func titleFirst(_ size: CGFloat = 34) -> UIFont {
        return FontFamily.SFProDisplay.bold.font(size: size)
    }
    /// SFProDisplay.bold - 28
    class func titleSecond(_ size: CGFloat = 28) -> UIFont {
        return FontFamily.SFProDisplay.bold.font(size: size)
    }
    /// SFProDisplay.bold - 25
    class func titleThrid(_ size: CGFloat = 25) -> UIFont {
        return FontFamily.SFProDisplay.bold.font(size: size)
    }
    /// SFProDisplay.bold - 20
    class func titleFourth(_ size: CGFloat = 20) -> UIFont {
        return FontFamily.SFProDisplay.bold.font(size: size)
    }
    /// SFProText.semibold - 17
    class func headline(_ size: CGFloat = 17) -> UIFont {
        return FontFamily.SFProText.semibold.font(size: size)
    }
    /// SFProText.regular - 17
    class func body(_ size: CGFloat = 17) -> UIFont {
        return FontFamily.SFProText.regular.font(size: size)
    }
    /// SFProText.regular - 16
    class func callout(_ size: CGFloat = 16) -> UIFont {
        return FontFamily.SFProText.regular.font(size: size)
    }
    /// SFProText.regular - 15
    class func subheadFirst(_ size: CGFloat = 15) -> UIFont {
        return FontFamily.SFProText.regular.font(size: size)
    }
    /// SFProText.semibold - 15
    class func subheadSecond(_ size: CGFloat = 15) -> UIFont {
        return FontFamily.SFProText.semibold.font(size: size)
    }
    /// SFProText.regular - 13
    class func footnote(_ size: CGFloat = 13) -> UIFont {
        return FontFamily.SFProText.regular.font(size: size)
    }
    /// SFProText.regular - 13
    class func footnoteFirst(_ size: CGFloat = 13) -> UIFont {
        return FontFamily.SFProText.regular.font(size: size)
    }
    /// SFProText.semibold - 13
    class func footnoteSecond(_ size: CGFloat = 13) -> UIFont {
        return FontFamily.SFProText.semibold.font(size: size)
    }
    /// SFProText.regular - 12
    class func captionFirst(_ size: CGFloat = 12) -> UIFont {
        return FontFamily.SFProText.regular.font(size: size)
    }
    /// SFProText.semibold - 11
    class func captionSecond(_ size: CGFloat = 11) -> UIFont {
        return FontFamily.SFProText.semibold.font(size: size)
    }
}

internal enum Font {
    case titleFirst(size: CGFloat)
    case titleSecond(size: CGFloat)
    case titleThrid(size: CGFloat)
    case titleFourth(size: CGFloat)
    
    case headline(size: CGFloat)
    case body(size: CGFloat)
    case callout(size: CGFloat)
    case subheadFirst(size: CGFloat)
    case subheadSecond(size: CGFloat)
    
    case footnote(size: CGFloat)
    case footnoteFirst(size: CGFloat)
    case footnoteSecond(size: CGFloat)
    case captionFirst(size: CGFloat)
    case captionSecond(size: CGFloat)
    case `default`(size: CGFloat)
    
    internal var font: UIFont {
        switch self {
        case let .titleFirst(size: value):
            return UIFont.titleFirst(value)
        case let .titleSecond(size: value):
            return UIFont.titleSecond(value)
        case let .titleThrid(size: value):
            return UIFont.titleThrid(value)
        case let .titleFourth(size: value):
            return UIFont.titleFourth(value)
        case let .headline(size: value):
            return UIFont.headline(value)
        case let .body(size: value):
            return UIFont.body(value)
        case let .callout(size: value):
            return UIFont.callout(value)
        case let .subheadFirst(size: value):
            return UIFont.subheadFirst(value)
        case let .subheadSecond(size: value):
            return UIFont.subheadSecond(value)
        case let .footnote(size: value):
            return UIFont.footnote(value)
        case let .footnoteFirst(size: value):
            return UIFont.footnoteFirst(value)
        case let .footnoteSecond(size: value):
            return UIFont.footnoteSecond(value)
        case let .captionFirst(size: value):
            return UIFont.captionFirst(value)
        case let .captionSecond(size: value):
            return UIFont.captionSecond(value)
        default:
            return UIFont.default()
        }
    }
}
