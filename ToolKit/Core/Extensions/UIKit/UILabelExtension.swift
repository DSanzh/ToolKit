//
//  UILabel.swift
//  ToolKit
//
//  Created by Санжар Дауылов on 7/13/20.
//  Copyright © 2020 D. Sanzhar. All rights reserved.
//

import UIKit

extension UILabel {
    func setAttributed(with title: String, lineHeight: CGFloat = 0.84, color: UIColor) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = lineHeight
        // Line height: 14 pt
        // (identical to box height)
        self.attributedText = NSMutableAttributedString(
            string: title,
            attributes: [.paragraphStyle: paragraphStyle,
                         .foregroundColor: color]
        )
    }
}

extension UILabel {
    
    func set(image: UIImage, with text: String) {
        let attachment = NSTextAttachment()
        attachment.image = image
        attachment.bounds = CGRect(x: 0, y: 0, width: 15, height: 11)
        let attachmentStr = NSAttributedString(attachment: attachment)

        let mutableAttributedString = NSMutableAttributedString()
        mutableAttributedString.append(attachmentStr)

        let textString = NSAttributedString(string: text, attributes: [.font: self.font ?? UIFont.systemFontSize])
        mutableAttributedString.append(textString)

        self.attributedText = mutableAttributedString
    }

    func set(image: UIImage, with text: String, size: CGSize) {
        let attachment = NSTextAttachment()
        attachment.image = image
        attachment.bounds = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        let attachmentStr = NSAttributedString(attachment: attachment)

        let mutableAttributedString = NSMutableAttributedString()
        mutableAttributedString.append(attachmentStr)

        let textString = NSAttributedString(string: text, attributes: [.font: self.font ?? UIFont.systemFontSize])
        mutableAttributedString.append(textString)

        self.attributedText = mutableAttributedString
    }

    func set(image: UIImage, with text: String, frame: CGRect) {
        let attachment = NSTextAttachment()
        attachment.image = image
        attachment.bounds = frame
        let attachmentStr = NSAttributedString(attachment: attachment)

        let mutableAttributedString = NSMutableAttributedString()
        mutableAttributedString.append(attachmentStr)

        let textString = NSAttributedString(string: text, attributes: [.font: self.font ?? UIFont.systemFontSize])
        mutableAttributedString.append(textString)

        self.attributedText = mutableAttributedString
    }
    
    func setColor(_ color: UIColor, location: Int, length: Int) {

        guard let text = self.text else { return }
        if text.count < location + length {
            return
        }
        
        var attText: NSMutableAttributedString!
        if let attributedText = self.attributedText {
            attText = NSMutableAttributedString(attributedString: attributedText)
        } else {
            attText = NSMutableAttributedString(string: text)
        }
        
        let range = NSRange(location: location, length: length)
        attText.addAttribute(.foregroundColor, value: color, range: range)
        attributedText = attText

    }
    
    func setFont(_ font: UIFont?, location: Int, length: Int) {

        guard let text = self.text else { return }
        guard let font = font else { return }
        if text.count < location + length {
            return
        }
        
        var attText: NSMutableAttributedString!
        if let attributedText = self.attributedText {
            attText = NSMutableAttributedString(attributedString: attributedText)
        } else {
            attText = NSMutableAttributedString(string: text)
        }
        
        let range = NSRange(location: location, length: length)
        attText.addAttribute(.font, value: font, range: range)
        self.attributedText = attText

    }
}

extension UILabel {
    func setHTMLString(_ string: String?) {
        var attributedString = NSAttributedString(string: "")
        defer { self.attributedText = attributedString }
        
        guard let font = font else { return }
        
        let style = NSMutableParagraphStyle()
        style.alignment = textAlignment
        
        let modifiedFont = String(format:"<span style=\"font-family: \(font.fontName); font-size: \(font.pointSize)\">%@</span>", string ?? "")
        let options: [NSAttributedString.DocumentReadingOptionKey: NSAttributedString.DocumentType] = [.documentType: .html]
        
        guard let data = modifiedFont.data(using: .unicode),
            let attributedText = try? NSMutableAttributedString(data: data,
                                                                options: options,
                                                                documentAttributes: nil)
            else { return }
        
        attributedText.addAttributes([.paragraphStyle: style],
                                     range: NSMakeRange(0, attributedText.length))
        
        attributedString = attributedText
    }
}

extension UITextView {
    func setHTMLString(_ string: String?) {
        var attributedString = NSAttributedString(string: "")
        defer { self.attributedText = attributedString }
        
        guard let font = font else { return }
        
        let style = NSMutableParagraphStyle()
        style.alignment = textAlignment
        
        let modifiedFont = String(format:"<span style=\"font-family: \(font.fontName); font-size: \(font.pointSize)\">%@</span>", string ?? "")
        let options: [NSAttributedString.DocumentReadingOptionKey: NSAttributedString.DocumentType] = [.documentType: .html]
        
        guard let data = modifiedFont.data(using: .unicode),
            let attributedText = try? NSMutableAttributedString(data: data,
                                                                options: options,
                                                                documentAttributes: nil)
            else { return }
        
        attributedText.addAttributes([.paragraphStyle: style],
                                     range: NSMakeRange(0, attributedText.length))
        
        attributedString = attributedText
    }
}
