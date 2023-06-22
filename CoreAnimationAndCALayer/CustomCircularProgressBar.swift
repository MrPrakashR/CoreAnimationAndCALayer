//
//  CustomCircularProgressBar.swift
//  CoreAnimationAndCALayer
//
//  Created by WYH IOS  on 22/06/23.
//

import UIKit

@IBDesignable
class CustomCircularProgressBar: UIView {
    
    var shapeLayer : CAShapeLayer = {
       
        let shape = CAShapeLayer()
        shape.lineWidth = 10
        shape.lineCap = .round
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = UIColor.gray.cgColor
        
        return shape
    }()
    
    var progressShapeLayer : CAShapeLayer = {
       
        let shape = CAShapeLayer()
        shape.lineWidth = 10
        shape.lineCap = .round
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = UIColor.red.cgColor
        
        return shape
    }()

    @IBInspectable var progress : CGFloat = 0.8 {
        didSet {
            setProgress()
        }
    }
    
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
        self.layer.addSublayer(progressShapeLayer)
        
        let width = bounds.width
        let height = bounds.height
        
        
        let path = UIBezierPath(arcCenter: CGPoint(x: width/2.0, y: height/2.0), radius: width/2.0, startAngle: -.pi/2, endAngle: 3*(.pi)/2, clockwise: true)
        shapeLayer.path = path.cgPath
        progressShapeLayer.path = path.cgPath
        
        setProgress()
    }
    
    
    private func setProgress() {
        
        let caAnimation = CABasicAnimation(keyPath: "strokeEnd")
        caAnimation.fromValue = 0
        caAnimation.toValue = progress
        caAnimation.duration = 5
        progressShapeLayer.add(caAnimation, forKey: "progress")
        
        progressShapeLayer.strokeEnd = progress
    }
    
}
