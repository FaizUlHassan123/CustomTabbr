//
//  UIView + Extension.swift
//  CustomTabbr
//
//  Created by Faiz Ul Hassan on 31/01/2023.
//

import Foundation
import UIKit
import Foundation

// MARK: - Designable Extension


extension UIView {
    
//    #if DEBUG
//    /// Should the corner be as circle
//    var circleCorner: Bool {
//        get {
//            return min(bounds.size.height, bounds.size.width) / 2 == cornerRadius
//        }
//        set {
//            cornerRadius = newValue ? min(bounds.size.height, bounds.size.width) / 2 : cornerRadius
//        }
//    }
//
//
//    /// Corner radius of view; also inspectable from Storyboard.
//    var cornerRadius: CGFloat {
//        get {
//            return layer.cornerRadius
//        }
//        set {
//            layer.cornerRadius = circleCorner ? min(bounds.size.height, bounds.size.width) / 2 : newValue
//            //abs(CGFloat(Int(newValue * 100)) / 100)
//        }
//    }
//
//    /// Border color of view; also inspectable from Storyboard.
//    var borderColor: UIColor? {
//        get {
//            guard let color = layer.borderColor else {
//                return nil
//            }
//            return UIColor(cgColor: color)
//        }
//        set {
//            guard let color = newValue else {
//                layer.borderColor = nil
//                return
//            }
//            layer.borderColor = color.cgColor
//        }
//    }
//    /// Shadow color of view; also inspectable from Storyboard.
//    var shadowColor: UIColor? {
//        get {
//            guard let color = layer.shadowColor else {
//                return nil
//            }
//            return UIColor(cgColor: color)
//        }
//        set {
//            layer.shadowColor = newValue?.cgColor
//        }
//    }
//
//    /// Shadow offset of view; also inspectable from Storyboard.
//    var shadowOffset: CGSize {
//        get {
//            return layer.shadowOffset
//        }
//        set {
//            layer.shadowOffset = newValue
//        }
//    }
//
//    /// Shadow opacity of view; also inspectable from Storyboard.
//    var shadowOpacity: Double {
//        get {
//            return Double(layer.shadowOpacity)
//        }
//        set {
//            layer.shadowOpacity = Float(newValue)
//        }
//    }
//    #else
    /// Should the corner be as circle
    @IBInspectable public var circleCorner: Bool {
        get {
            return min(bounds.size.height, bounds.size.width) / 2 == cornerRadius
        }
        set {
            cornerRadius = newValue ? min(bounds.size.height, bounds.size.width) / 2 : cornerRadius
        }
    }
    
    
    /// Corner radius of view; also inspectable from Storyboard.
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = circleCorner ? min(bounds.size.height, bounds.size.width) / 2 : newValue
            //abs(CGFloat(Int(newValue * 100)) / 100)
        }
    }
    
    /// Border color of view; also inspectable from Storyboard.
    @IBInspectable public var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
        set {
            guard let color = newValue else {
                layer.borderColor = nil
                return
            }
            layer.borderColor = color.cgColor
        }
    }
    /// Shadow color of view; also inspectable from Storyboard.
    @IBInspectable public var shadowColor: UIColor? {
        get {
            guard let color = layer.shadowColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }
    
    /// Shadow offset of view; also inspectable from Storyboard.
    @IBInspectable public var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    /// Shadow opacity of view; also inspectable from Storyboard.
    @IBInspectable public var shadowOpacity: Double {
        get {
            return Double(layer.shadowOpacity)
        }
        set {
            layer.shadowOpacity = Float(newValue)
        }
    }
//    #endif
    
    
    /// Border width of view; also inspectable from Storyboard.
    public var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    
    
    
    /// Shadow radius of view; also inspectable from Storyboard.
    public var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    /// Shadow path of view; also inspectable from Storyboard.
    public var shadowPath: CGPath? {
        get {
            return layer.shadowPath
        }
        set {
            layer.shadowPath = newValue
        }
    }
    
    
    /// Should shadow rasterize of view; also inspectable from Storyboard.
    /// cache the rendered shadow so that it doesn't need to be redrawn
    public var shadowShouldRasterize: Bool {
        get {
            return layer.shouldRasterize
        }
        set {
            layer.shouldRasterize = newValue
        }
    }
    
    
    /// Should shadow rasterize of view; also inspectable from Storyboard.
    /// cache the rendered shadow so that it doesn't need to be redrawn
    public var shadowRasterizationScale: CGFloat {
        get {
            return layer.rasterizationScale
        }
        set {
            layer.rasterizationScale = newValue
        }
    }
    
    
    /// Corner radius of view; also inspectable from Storyboard.
    public var maskToBounds: Bool {
        get {
            return layer.masksToBounds
        }
        set {
            layer.masksToBounds = newValue
        }
    }
}


// MARK: - Properties

public extension UIView {
    
    /// Size of view.
    var size: CGSize {
        get {
            return self.frame.size
        }
        set {
            self.width = newValue.width
            self.height = newValue.height
        }
    }
    
    /// Width of view.
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }
    
    /// Height of view.
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }
}

extension UIView {
    
    func superview<T>(of type: T.Type) -> T? {
        return superview as? T ?? superview.flatMap { $0.superview(of: T.self) }
    }
    
}


// MARK: - Methods

public extension UIView {
    
    typealias Configuration = (UIView) -> Swift.Void
    
    func config(configurate: Configuration?) {
        configurate?(self)
    }
    
    /// Set some or all corners radiuses of view.
    ///
    /// - Parameters:
    ///   - corners: array of corners to change (example: [.bottomLeft, .topRight]).
    ///   - radius: radius for selected corners.
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
}

extension UIView {
    
    func searchVisualEffectsSubview() -> UIVisualEffectView? {
        if let visualEffectView = self as? UIVisualEffectView {
            return visualEffectView
        } else {
            for subview in subviews {
                if let found = subview.searchVisualEffectsSubview() {
                    return found
                }
            }
        }
        return nil
    }
    
    /// This is the function to get subViews of a view of a particular type
    /// https://stackoverflow.com/a/45297466/5321670
    func subViews<T : UIView>(type : T.Type) -> [T]{
        var all = [T]()
        for view in self.subviews {
            if let aView = view as? T{
                all.append(aView)
            }
        }
        return all
    }
    
    
    /// This is a function to get subViews of a particular type from view recursively. It would look recursively in all subviews and return back the subviews of the type T
    /// https://stackoverflow.com/a/45297466/5321670
    func allSubViewsOf<T : UIView>(type : T.Type) -> [T]{
        var all = [T]()
        func getSubview(view: UIView) {
            if let aView = view as? T{
                all.append(aView)
            }
            guard view.subviews.count>0 else { return }
            view.subviews.forEach{ getSubview(view: $0) }
        }
        getSubview(view: self)
        return all
    }
}

extension UIView {
    // Example use: myView.addBorder(toSide: .Left, withColor: UIColor.redColor().CGColor, andThickness: 1.0)

    enum ViewSide {
        case Left, Right, Top, Bottom
    }

    func addBorder(toSide side: ViewSide, withColor color: CGColor, andThickness thickness: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color
        border.name = "border_bottom"
        switch side {
        case .Left: border.frame = CGRect(x: frame.minX, y: frame.minY, width: thickness, height: frame.height)
        case .Right: border.frame = CGRect(x: frame.maxX, y: frame.minY, width: thickness, height: frame.height)
        case .Top: border.frame = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: thickness)
        case .Bottom: border.frame = CGRect(x: frame.minX, y: frame.maxY, width: frame.width, height: thickness)
        }

        for layer in layer.sublayers! {
             if layer.name == "border_bottom" {
                  layer.removeFromSuperlayer()
             }
         }
        if thickness == 0{
//            self.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        }else{
//            self.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
            layer.addSublayer(border)
        }

    }
}
extension UIButton {

    func btnaddBorder(withColor color: UIColor, andThickness thickness: CGFloat) {
        let frame = CGRect(x: 0, y: frame.size.height, width: frame.size.width, height: 2)
        let borderBottom = UIView(frame: frame)
        borderBottom.layer.name = "border_bottom"
        borderBottom.backgroundColor = color

        if thickness == 0{

        }else{
            addSubview(borderBottom)
        }

    }

    func addBottomBorder(withColor color: UIColor,andThickness thickness: CGFloat) {
        let border = CALayer()
        border.borderColor = color.cgColor
        border.frame = CGRect(x: 0, y: frame.size.height - thickness, width: frame.size.width, height: frame.size.height)
        border.name = "border_bottom"
        border.borderWidth = thickness
        if let subLayer = layer.sublayers{
            for layer in subLayer{
                if layer.name == "border_bottom"{
                    layer.removeFromSuperlayer()
                }
            }
        }

        if thickness == 0{

        }else{
            layer.addSublayer(border)
        }

        layer.masksToBounds = true
    }
}

class round_rightCorenrs:UIView {

//    required init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)!
//
//        self.roundCorners(corners: [.topRight, .bottomRight], radius: 10)
//    }

    override func draw(_ rect: CGRect) {

        self.roundCorners(corners: [.topRight, .bottomRight], radius: 10)
    }

}
