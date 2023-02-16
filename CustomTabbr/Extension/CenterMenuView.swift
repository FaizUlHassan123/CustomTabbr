//
//  CenterMenuView.swift
//  CustomTabbr
//
//  Created by Faiz Ul Hassan on 16/02/2023.
//

import Foundation
import UIKit

class CenterMenuView: UIView {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
    }
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let y:CGFloat = 40
        let curveTo:CGFloat = 0
        
        let myBezier = UIBezierPath()
        myBezier.move(to: CGPoint(x: 0, y: y))
        myBezier.addQuadCurve(to: CGPoint(x: rect.width, y: y), controlPoint: CGPoint(x: rect.width / 2, y: curveTo))
        myBezier.addLine(to: CGPoint(x: rect.width, y: rect.height))
        myBezier.addLine(to: CGPoint(x: 0, y: rect.height))
        myBezier.close()
        
        
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = myBezier.cgPath
        layer.mask = maskLayer1

//        let gradient = CAGradientLayer()
//        var bounds = UINavigationBar.appearance().bounds
//
//        bounds.size.height = self.height
//
//
//        bounds.size.width = UIScreen.main.bounds.width
//        gradient.frame = bounds
//
//        gradient.colors = [ UIColor.green, UIColor.blue ].map{$0.cgColor}
//        gradient.locations = [0, 1]
//
//        gradient.startPoint = CGPoint(x: 1.0, y: 1.0)
//        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)

//        self.layer.insertSublayer(gradient, at: 0)
        
    }
    
}
