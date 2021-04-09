//
//  animationView.swift
//  jveit-algMultiThreading
//
//  Created by Jeffrey Veit on 4/7/21.
//

import UIKit

class animationView: UIView {
    
    weak var shapeLayer: CAShapeLayer?
    
    public func drawish(_ x: Int, _ y: Int)
        {
        
        
            shapeLayer?.removeFromSuperlayer()

            // create whatever path you want
        
            let path = UIBezierPath()
            path.move(to: CGPoint(x: 0 + x, y: 225))
            path.addLine(to: CGPoint(x: 0 + x, y: 150))
            path.addLine(to: CGPoint(x: 0 + x, y: 30 - y))

            // create shape layer for that path

            let shapeLayer = CAShapeLayer()
            shapeLayer.fillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0).cgColor
            shapeLayer.strokeColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1).cgColor
            shapeLayer.lineWidth = 10
            shapeLayer.path = path.cgPath

            // animate it

            layer.addSublayer(shapeLayer)
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.fromValue = 0
            animation.duration = 1
            shapeLayer.add(animation, forKey: "MyAnimation")

            // save shape layer

            self.shapeLayer = shapeLayer
        
            

        }
    
    public func drawishBelow(_ x: Int, _ y: Int)
        {
        
            shapeLayer?.removeFromSuperlayer()

            // create whatever path you want
        
            let path = UIBezierPath()
            path.move(to: CGPoint(x: 0 + x, y: 225))
            path.addLine(to: CGPoint(x: 0 + x, y: 150))
            path.addLine(to: CGPoint(x: 0 + x, y: 30 - y))

            // create shape layer for that path

            let shapeLayer = CAShapeLayer()
            shapeLayer.fillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0).cgColor
            shapeLayer.strokeColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1).cgColor
            shapeLayer.lineWidth = 10
            shapeLayer.path = path.cgPath

            // animate it

            layer.addSublayer(shapeLayer)
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.fromValue = 0
            animation.duration = 1
            shapeLayer.add(animation, forKey: "MyAnimation")

            // save shape layer

            self.shapeLayer = shapeLayer
        
            

        }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
