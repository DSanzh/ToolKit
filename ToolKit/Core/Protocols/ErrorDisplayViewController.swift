//
//  ErrorDisplayViewController.swift
//  ToolKit
//
//  Created by Sanzhar Dauylov on 08.01.2021.
//  Copyright © 2021 D. Sanzhar. All rights reserved.
//

import UIKit

protocol ErrorDisplayViewController: class {
    func displayError(_ error: Error)
}

extension ErrorDisplayViewController where Self: UIViewController {
    func displayError(_ error: Error) {
        alert(message: error.localizedDescription)
    }
}
