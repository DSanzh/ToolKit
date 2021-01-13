//
//  LoadableViewController.swift
//  ToolKit
//
//  Created by Sanzhar Dauylov on 08.01.2021.
//  Copyright © 2021 D. Sanzhar. All rights reserved.
//

import UIKit

protocol LoadableViewController: class {
    func hideLoading()
    func showLoading()
}

extension LoadableViewController where Self: UIViewController {
    func hideLoading() {

    }
    func showLoading() {
        
    }
}
