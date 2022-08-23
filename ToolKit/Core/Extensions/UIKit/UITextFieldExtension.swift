//
//  UITextFieldExtension.swift
//  ToolKit
//
//  Created by Санжар Дауылов on 7/8/20.
//  Copyright © 2020 D. Sanzhar. All rights reserved.
//

import UIKit

extension UITextField {
    func getUpdatedText(shouldChangeCharactersIn range: NSRange, replacementString string: String) -> String {
        // get the current text, or use an empty string if that failed
        let currentText = self.text ?? ""
        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return currentText }
        // add their new text to the existing text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return updatedText
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
