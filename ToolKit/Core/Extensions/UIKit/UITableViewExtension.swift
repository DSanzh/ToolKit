//
//  UITableViewExtension.swift
//  ToolKit
//
//  Created by Санжар Дауылов on 7/8/20.
//  Copyright © 2020 D. Sanzhar. All rights reserved.
//

import UIKit

extension UITableView {
    
    /// Register UITableViewCell which implements ReusableView Protocol
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView {
        register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    /// Register UITableViewCellNib which implements ReusableView Protocol
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    /// Reuse UITableViewCell which implements ReusableView Protocol
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        return cell
    }
    
    /// Reuse UITableViewHeaderFooterView  which implements ReusableView Protocol
    func dequeReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T where T: ReusableView {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: T.defaultReuseIdentifier) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        return view
    }
}

extension UITableView {
    func adjustToContentSize() {
        let size = UIScreen.main.bounds
        let tableHeight = contentSize.height
        var tableY = size.height - tableHeight
        if UIDevice().hasBottomOffset(), #available(iOS 11.0, *) {
            print(self.superview?.safeAreaInsets.bottom ?? 0)
            let bottomOffset = (self.superview?.safeAreaInsets.bottom ?? 0) + 20
            print(bottomOffset)
            tableY -= (bottomOffset)
        } else if #available(iOS 12.0, *) {
            tableY -= 20
        }
        frame = CGRect(x: 0, y: tableY, width: size.width, height: size.height)
        layoutIfNeeded()
        reloadData()
    }
    func emptyFooterView(height: CGFloat) {
        tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: height))
        sectionFooterHeight = height
        estimatedSectionFooterHeight = height
    }
    func addExitTapGesture() {
        let hideKeyboardTapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        hideKeyboardTapGesture.cancelsTouchesInView = false
        addGestureRecognizer(hideKeyboardTapGesture)
    }
    @objc private func hideKeyboard() {
        endEditing(true)
    }
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .blue
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = .systemFont(ofSize: 20, weight: .medium)
        messageLabel.sizeToFit()

        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }

    func restore() {
        self.backgroundView = nil
    }
}
