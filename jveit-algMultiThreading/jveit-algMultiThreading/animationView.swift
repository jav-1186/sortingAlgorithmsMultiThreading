//
//  animationView.swift
//  jveit-algMultiThreading
//
//  Created by Jeffrey Veit on 4/7/21.
//  Custom UIView class to show animation
//

import UIKit

class animationView: UIView {
    
    weak var shapeLayer: CAShapeLayer?
    
    public func drawish(_ x: Int, _ y: Int)
        {
            shapeLayer?.removeFromSuperlayer()

            // Drawing line based on data based to this function via array status
            let path = UIBezierPath()
            path.move(to: CGPoint(x: 0 + x, y: 225))
            path.addLine(to: CGPoint(x: 0 + x, y: 150))
            
            // Controlling height of lines
            if y > 190
            {
                path.addLine(to: CGPoint(x: 0 + x, y: 125 - 190))
            }
    
            else
            {
                path.addLine(to: CGPoint(x: 0 + x, y: 125 - y))
            }
            
            // Line characteristcs
            let shapeLayer = CAShapeLayer()
            shapeLayer.fillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0).cgColor
            shapeLayer.strokeColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1).cgColor
            shapeLayer.lineWidth = 10
            shapeLayer.path = path.cgPath

            // Animation
            layer.addSublayer(shapeLayer)
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.fromValue = 0
            animation.duration = 1
            shapeLayer.add(animation, forKey: "MyAnimation")
            self.shapeLayer = shapeLayer
        }
    
    // Same function as above but for below view, and with different color
    public func drawishBelow(_ x: Int, _ y: Int)
        {
        
            shapeLayer?.removeFromSuperlayer()

            let path = UIBezierPath()
            path.move(to: CGPoint(x: 0 + x, y: 225))
            path.addLine(to: CGPoint(x: 0 + x, y: 150))
            
            if y > 190
            {
                path.addLine(to: CGPoint(x: 0 + x, y: 125 - 190))
            }
        
            else
            {
                path.addLine(to: CGPoint(x: 0 + x, y: 125 - y))
            }
            
            let shapeLayer = CAShapeLayer()
            shapeLayer.fillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0).cgColor
            shapeLayer.strokeColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1).cgColor
            shapeLayer.lineWidth = 10
            shapeLayer.path = path.cgPath

            layer.addSublayer(shapeLayer)
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.fromValue = 0
            animation.duration = 1
            shapeLayer.add(animation, forKey: "MyAnimation")
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
