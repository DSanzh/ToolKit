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


#if canImport(LinkPresentation)
    import LinkPresentation
#endif


class OptionalTextActivityItemSource: NSObject, UIActivityItemSource {
    let text: String
    weak var viewController: UIViewController?
    
    init(text: String) {
        self.text = text
    }
    
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return text
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        if activityType?.rawValue == "net.whatsapp.WhatsApp.ShareExtension" {
            return nil
        } else {
            return text
        }
    }
}

/// For whatever reason `UIActivityViewController` on iOS 13 only provides a preview of the image if it's passed as a URL, rather than a `UIImage` (if `UIImage` just shows app icon, see here: https://stackoverflow.com/questions/57850483/).
/// However we can't pass the URL to the image because when paired with a String on iOS 13 (image URLs are fine on their own) Messages won't accept it.
/// So when sharing both, wrap the UIImage object and manually provide the preview via the `LinkPresentation` framework.
class ImageActivityItemSource: NSObject, UIActivityItemSource {
    let image: UIImage
    
    init(image: UIImage) {
        self.image = image
    }
    
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return image
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        return image
    }
    
    @available(iOS 13.0, *)
    func activityViewControllerLinkMetadata(_ activityViewController: UIActivityViewController) -> LPLinkMetadata? {
        let imageProvider = NSItemProvider(object: image)
        
        let metadata = LPLinkMetadata()
        metadata.imageProvider = imageProvider
        metadata.title = "QR"
        return metadata
    }
}
