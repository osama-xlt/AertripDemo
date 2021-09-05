//
//  UIViewExtension.swift
//  AertripDemo
//
//  Created by Osama Mohammed Shaikh on 05/09/21.
//

import Foundation

extension UIView {
    func addDashedBorder() {
        let color = UIColor.lightGray.cgColor
        
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = 0.5
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = [6,3]
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 0).cgPath
        
        if let layers = self.layer.sublayers {
            if layers.count > 0 {
                for layer in layers {
                    layer.removeFromSuperlayer()
                }
                self.layer.addSublayer(shapeLayer)
            } else {
                self.layer.addSublayer(shapeLayer)
            }
        } else {
            self.layer.addSublayer(shapeLayer)
        }
    }
}
