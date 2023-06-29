//
//  SShapeView.swift
//  CoreAnimationAndCALayer
//
//  Created by WYH IOS  on 29/06/23.
//

import Foundation
import UIKit

class SShapeView : UIView {
    
    var shapeLayer : CAShapeLayer = {
       
        let shape = CAShapeLayer()
        shape.lineWidth = 10
        shape.lineCap = .round
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = UIColor.gray.cgColor
        
        return shape
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initializeView()
    }
    
    private func initializeView() {
        self.layer.addSublayer(shapeLayer)
        
        let width = bounds.width
        let height = bounds.height
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 50, y: 0))
        path.addCurve(to: CGPoint(x: width/2, y: height/2), controlPoint1: CGPoint(x: width, y: 20), controlPoint2: CGPoint(x: width, y: (height/2) - 20))
//        path.close()
        
        path.addCurve(to: CGPoint(x: width - 50, y: height - 10), controlPoint1: CGPoint(x: 0, y: height/2 + 20), controlPoint2: CGPoint(x: 0, y: height - 20))
        
        shapeLayer.path = path.cgPath
        
        let caAnimation = CABasicAnimation(keyPath: "strokeEnd")
        caAnimation.fromValue = 0
        caAnimation.toValue = 1
        caAnimation.duration = 5
        caAnimation.repeatCount = .infinity
        shapeLayer.add(caAnimation, forKey: "shape")
    }
    
}
