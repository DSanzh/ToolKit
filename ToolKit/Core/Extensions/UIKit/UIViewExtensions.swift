//
//  UIViewExtensions.swift
//  ToolKit
//
//  Created by Санжар Дауылов on 25.03.2020.
//  Copyright © 2020 D. Sanzhar. All rights reserved.
//

import UIKit

extension UIView {
    func addDashedBorder(width: CGFloat? = nil,
                         height: CGFloat? = nil,
                         lineWidth: CGFloat = 2,
                         lineDashPattern: [NSNumber]? = [6, 4],
                         strokeColor: UIColor = UIColor.red,
                         fillColor: UIColor = UIColor.clear) {
        var fWidth: CGFloat? = width
        var fHeight: CGFloat? = height
        let kShapeDashed: String = "kShapeDashed"

        if fWidth == nil {
            fWidth = self.frame.width
        }

        if fHeight == nil {
            fHeight = self.frame.height
        }

        let shapeLayer = CAShapeLayer()
        let shapeRect = CGRect(x: 0, y: 0, width: fWidth!, height: fHeight!)

        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: fWidth!/2, y: fHeight!/2)
        shapeLayer.fillColor = fillColor.cgColor
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = lineDashPattern
        shapeLayer.name = kShapeDashed
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 3).cgPath

        layer.addSublayer(shapeLayer)
    }

    func round(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

extension UIView {
    func loadViewFromNib(named name: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: name, bundle: bundle)
        return nib.instantiate(withOwner: self,
                               options: nil).first as? UIView
    }
}

extension UIView {
    struct ValuesHolder {
        static var tapClosures: [UIView: () -> Void] = [:]
    }
    var closure: () -> Void {
        get {
            return ValuesHolder.tapClosures[self] ?? {}
        }
        set(value) {
            ValuesHolder.tapClosures[self] = value
        }
    }

    func addTap(_ closure: @escaping () -> Void) {
        self.closure = closure
        self.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped))
        self.addGestureRecognizer(tap)
    }

    @objc private func tapped() {
        closure()
    }
}

extension UIView {
    
    func addGradient(colors: [UIColor] = [.blue, .white], locations: [NSNumber] = [0, 2], startPoint: CGPoint = CGPoint(x: 0.5, y: 0.0), endPoint: CGPoint = CGPoint(x: 0.5, y: 1.0), type: CAGradientLayerType = .axial){
        
        let gradient = CAGradientLayer()
        
        gradient.frame.size = self.frame.size
        gradient.frame.origin = CGPoint(x: 0.0, y: 0.0)

        // Iterates through the colors array and casts the individual elements to cgColor
        // Alternatively, one could use a CGColor Array in the first place or do this cast in a for-loop
        gradient.colors = colors.map { $0.cgColor }
        
        gradient.locations = locations
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        
        // Insert the new layer at the bottom-most position
        // This way we won't cover any other elements
        self.layer.insertSublayer(gradient, at: 0)
    }
}
