//
//  ViewController.swift
//  CoreAnimationAndCALayer
//
//  Created by WYH IOS  on 22/06/23.
//

import UIKit

class ViewController: UIViewController {

    private var displayLink : CADisplayLink?
    private var startTime : CFTimeInterval = 0
    private var shapeLayer : CAShapeLayer = {
        let shapeLayer = CAShapeLayer()
  
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 4
        
        return shapeLayer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.addSublayer(shapeLayer)
       
        
//        let coreAnimation = CABasicAnimation(keyPath: "strokeEnd")
//        coreAnimation.fromValue = 0
//        coreAnimation.toValue = 1
//        coreAnimation.duration = 5
//        coreAnimation.repeatDuration = .infinity
//        shapeLayer.add(coreAnimation, forKey: "strokeAnimation")
     
    }
    
    override func viewDidAppear(_ animated: Bool) {
        startDisplayLink()
    }

    override func viewWillDisappear(_ animated: Bool) {
        stopDisplayLink()
    }
    
    private func startDisplayLink() {
        startTime = CACurrentMediaTime()
        displayLink?.invalidate()
        let displayLink =  CADisplayLink(target: self, selector: #selector(handleDisplayLink))
        displayLink.add(to: .main, forMode: .common)
        self.displayLink = displayLink
    }
    
    private func stopDisplayLink()  {
        displayLink?.invalidate()
    }
    
    @objc func handleDisplayLink() {
        let elapsed = CACurrentMediaTime() - startTime
        moveWaveAnimation(elapsed: elapsed)
    }
    
    private func moveWaveAnimation(elapsed:CGFloat) {
        
        let amplitude : CGFloat = elapsed
        
        let width = self.view.bounds.width
        let height = self.view.bounds.height
        
        let frqency : CGFloat = 50
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: height/2))
        for x in 0...Int(width) {
            let y = frqency*sin(CGFloat(x)*amplitude) + height/2
            path.addLine(to: CGPoint(x: CGFloat(x), y: y))
        }
        
        shapeLayer.path = path.cgPath
      
    }

}

