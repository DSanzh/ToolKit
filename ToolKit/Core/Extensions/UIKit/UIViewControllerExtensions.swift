//
//  UIViewController.swift
//  ToolKit
//
//  Created by Санжар Дауылов on 8/5/20.
//  Copyright © 2020 D. Sanzhar. All rights reserved.
//

import UIKit

extension UIViewController {
    func close(_ animated: Bool) {
        if let navigationController = parent as? UINavigationController, navigationController.children.count > 1 {
            navigationController.popViewController(animated: animated)
        } else if presentingViewController != nil {
            dismiss(animated: animated, completion: nil)
        } else if view.superview != nil {
            view.removeFromSuperview()
        }
    }
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove() {
        // Just to be safe, we check that this view controller
        // is actually added to a parent before removing it.
        guard parent != nil else {
            return
        }

        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}


extension UIViewController {
    
    /// Sugar syntax for displaying Alert
    /// - Parameters:
    ///   - title: default value is "Error"
    ///   - message: body of alert, could be nil
    ///   - actionButtons: Array of action button, initialized with title, by default button with "OK" title
    ///   - cancelButton: Cancel button, by default is nil
    ///   - handler: handler all of buttons
    func alert(title: String? = "Error",
               message: String?,
               actionButtons: [String] = ["OK"],
               cancelButton: String? = nil,
               handler: ((UIAlertAction) -> Void)? = nil)
    {
        let alert = UIAlertController(title: title, message:message, preferredStyle: .alert)
        for button in actionButtons {
            alert.addAction(UIAlertAction(title: button, style: cancelButton == nil && actionButtons.count == 1 ? .cancel : .default, handler: handler))
        }

        if let button = cancelButton {
            alert.addAction(UIAlertAction(title: button, style: .cancel, handler: handler))
        }
        self.present(alert, animated: true, completion: nil)
    }
    /// Remove UIViewController by index from UINavigationController
    /// - Parameter number: index of removing UIViewController
    func removeSelfFromNavigationBy(_ number: Int) {
        guard let navigationController = navigationController else { return }
        var navigationArray = navigationController.viewControllers // To get all UIViewController stack as Array
        if navigationArray.count - number > 0 {
            navigationArray.remove(at: navigationArray.count - number) // To remove previous UIViewController
            self.navigationController?.viewControllers = navigationArray
        }
    }
    /// Removes all UIViewController from UINavigationController exept first one
    func removeTillRoot() {
        guard let navigationController = navigationController else { return }
        var navigationArray = navigationController.viewControllers // To get all UIViewController stack as Array
        for i in 1..<navigationArray.count {
            navigationArray.remove(at: i) // To remove previous UIViewController
        }
        self.navigationController?.viewControllers = navigationArray
    }
    
    func pushIfPossibleOrPresentWithNavigation(viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        if let navCont = self.navigationController {
            navCont.pushViewController(viewController, animated: animated)
        } else {
            let navCont = UINavigationController(rootViewController: viewController)
            navCont.modalPresentationStyle = .overFullScreen
            navCont.hidesBottomBarWhenPushed = true
            present(navCont, animated: animated, completion: completion)
        }
    }
    
    func pushIfPossibleOrPresent(viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        if let navCont = self.navigationController {
            navCont.pushViewController(viewController, animated: animated)
        } else {
            present(viewController, animated: animated, completion: completion)
        }
    }
    
    func popIfPossibleOrDissmiss(animated: Bool, completion: (() -> Void)?) {
        if let navCont = self.navigationController, navCont.viewControllers.count > 1 {
            navCont.popViewController(animated: animated)
            completion?()
        } else {
            self.dismiss(animated: animated, completion: completion)
        }
    }
    func removeLastVCsFromNavigation(amount: Int,
                                     andPushViewController viewController: UIViewController,
                                     animatedPush: Bool = true,
                                     completion: (() -> Void)?) {
        guard let navigationController = self.navigationController else { return }
        for _ in 0..<amount {
            if navigationController.viewControllers.count > 1 {
                navigationController.popViewController(animated: false)
            }
        }
        navigationController.pushViewController(viewController, animated: animatedPush)
    }
    func popByRemovingLastViewControllers(amount: Int,
                                          animated: Bool = true,
                                          completion: (() -> Void)?) {
        guard let navigationController = self.navigationController else { return }
        for _ in 0..<amount {
            if navigationController.viewControllers.count > 1 {
                navigationController.popViewController(animated: animated)
            }
        }
    }
}
