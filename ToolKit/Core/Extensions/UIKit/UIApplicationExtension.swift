//
//  UIApplication.swift
//  ToolKit
//
//  Created by Санжар Дауылов on 08.01.2021.
//  Copyright © 2021 D. Sanzhar. All rights reserved.
//

import UIKit

extension UIApplication {
    /// Recursivly try to get Presented UIViewController from UINavigationController, UITabBarController or PresentedViewController
    /// - Parameter controller: By Default get Root UIViewController
    /// - Returns: option presented UIViewController
    class func topVC(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topVC(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topVC(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topVC(controller: presented)
        }
        return controller
    }
    
    static func removeLastViewController(animated: Bool = false, completion: @escaping (() -> Void)) {
        if (UIApplication.topVC()?.navigationController?.viewControllers.count ?? 1) > 1 {
            UIApplication.topVC()?.navigationController?.popViewController(animated: animated)
            completion()
        } else {
            UIApplication.topVC()?.dismiss(animated: animated, completion: completion)
        }
    }
}

extension UIApplication {
    class var topViewController: UIViewController? { return topVC() }

    private class func _share(_ data: [Any],
                              applicationActivities: [UIActivity]?,
                              setupViewControllerCompletion: ((UIActivityViewController) -> Void)?) {
        let activityViewController = UIActivityViewController(activityItems: data, applicationActivities: nil)
        setupViewControllerCompletion?(activityViewController)
        UIApplication.topViewController?.present(activityViewController, animated: true, completion: nil)
    }

    class func share(_ data: Any...,
                     applicationActivities: [UIActivity]? = nil,
                     setupViewControllerCompletion: ((UIActivityViewController) -> Void)? = nil) {
        _share(data, applicationActivities: applicationActivities, setupViewControllerCompletion: setupViewControllerCompletion)
    }
    class func share(_ data: [Any],
                     applicationActivities: [UIActivity]? = nil,
                     setupViewControllerCompletion: ((UIActivityViewController) -> Void)? = nil) {
        _share(data, applicationActivities: applicationActivities, setupViewControllerCompletion: setupViewControllerCompletion)
    }
}
