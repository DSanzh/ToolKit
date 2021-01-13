//
//  UIImage.swift
//  ToolKit
//
//  Created by Санжар Дауылов on 08.01.2021.
//  Copyright © 2021 D. Sanzhar. All rights reserved.
//

import UIKit

extension UIImage {
    func imageWithColor(color1: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        color1.setFill()

        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: self.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.setBlendMode(CGBlendMode.normal)

        let rect = CGRect(origin: .zero, size: CGSize(width: self.size.width, height: self.size.height))
        context?.clip(to: rect, mask: self.cgImage!)
        context?.fill(rect)

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
}

extension UIImage {
    func resized(to size: CGSize) -> UIImage? {
        let rect = CGRect(origin: .zero, size: size)
        let renderingMode = self.renderingMode
        // Perform image resizing
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        draw(in: rect)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return result?.withRenderingMode(renderingMode)
    }
    
    func resized(in layer: CAShapeLayer) -> UIImage? {
        let view = UIView()
        let rect = CGRect(origin: .zero, size: size)
        view.frame = rect
        view.layer.addSublayer(layer)
        view.layer.masksToBounds = true
        
        let renderingMode = self.renderingMode
        // Perform image resizing
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        draw(in: view.frame)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return result?.withRenderingMode(renderingMode)
    }
}

extension UIImage {
    class func drawImage(with color: UIColor, size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }
}
