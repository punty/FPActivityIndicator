//
//  FPActivityLoader.swift
//  FPActivityLoader
//
//  Created by Francesco Puntillo on 04/04/2016.
//  Copyright © 2016 Francesco Puntillo. All rights reserved.
//

import UIKit

@IBDesignable
class FPActivityLoader: UIView {
    
    static let defaultColor = UIColor.blackColor()
    static let defaultLineWidth: CGFloat = 2.0
    static let defaultCircleTime: Double = 1.5
    
    private var strokeAnimation: CAAnimationGroup {
        get {
            return generateAnimation()
        }
    }
    
    private var rotationAnimation: CABasicAnimation {
        get {
            return generateRotationAnimation()
        }
    }
    
    private var circleLayer: CAShapeLayer = CAShapeLayer()
    
    @IBInspectable
    var strokeColor: UIColor = UIColor.blackColor() {
        didSet {
            circleLayer.strokeColor = strokeColor.CGColor
        }
    }
    
    @IBInspectable
    var animating: Bool = true {
        didSet {
            updateAnimation()
        }
    }
    
    @IBInspectable
    var hideWhenNotAnimating: Bool = true {
        didSet {
            self.hidden = (self.hideWhenNotAnimating) && (!self.animating)
        }
    }
    
    @IBInspectable
    var lineWidth: CGFloat = CGFloat(2) {
        didSet {
            circleLayer.lineWidth = lineWidth
        }
    }
    
    @IBInspectable
    var circleTime: Double = 1.5 {
        didSet {
            circleLayer.removeAllAnimations()
            updateAnimation()
        }
    }
    
    //init methods
    override init(frame: CGRect) {
        lineWidth = FPActivityLoader.defaultLineWidth
        circleTime = FPActivityLoader.defaultCircleTime
        strokeColor = FPActivityLoader.defaultColor
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        lineWidth = FPActivityLoader.defaultLineWidth
        circleTime = FPActivityLoader.defaultCircleTime
        strokeColor = FPActivityLoader.defaultColor
        super.init(coder: aDecoder)
        setupView()
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
        lineWidth = FPActivityLoader.defaultLineWidth
        circleTime = FPActivityLoader.defaultCircleTime
        strokeColor = FPActivityLoader.defaultColor
        setupView()
    }
    
    func generateAnimation() -> CAAnimationGroup {
        let headAnimation = CABasicAnimation(keyPath: "strokeStart")
        headAnimation.beginTime = self.circleTime/3.0
        headAnimation.fromValue = 0
        headAnimation.toValue = 1
        headAnimation.duration = self.circleTime/1.5
        headAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        let tailAnimation = CABasicAnimation(keyPath: "strokeEnd")
        tailAnimation.fromValue = 0
        tailAnimation.toValue = 1
        tailAnimation.duration = self.circleTime/1.5
        tailAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.duration = self.circleTime
        groupAnimation.repeatCount = Float.infinity
        groupAnimation.animations = [headAnimation, tailAnimation]
        return groupAnimation
    }
    
    func generateRotationAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.fromValue = 0
        animation.toValue = 2*M_PI
        animation.duration = self.circleTime
        animation.repeatCount = Float.infinity
        return animation
    }
    
    func setupView() {
        layer.addSublayer(self.circleLayer)
        backgroundColor = UIColor.clearColor()
        circleLayer.fillColor = nil
        circleLayer.lineWidth = lineWidth
        circleLayer.lineCap = kCALineCapRound
        circleLayer.strokeColor = strokeColor.CGColor
 
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let center = CGPoint(x: bounds.size.width/2.0, y: bounds.size.height/2.0)
        let radius = min(bounds.size.width, bounds.size.height)/2.0 - circleLayer.lineWidth/2.0
        let endAngle = CGFloat(2*M_PI)
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: endAngle, clockwise: true)
        circleLayer.path = path.CGPath
        circleLayer.frame = bounds
        
    }
    
    func updateAnimation() {
        
        self.hidden = (self.hideWhenNotAnimating) && (!self.animating)
        if animating {
            circleLayer.addAnimation(strokeAnimation, forKey: "strokeLineAnimation")
            circleLayer.addAnimation(rotationAnimation, forKey: "rotationAnimation")
        } else {
            circleLayer.removeAllAnimations()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        setupView()
    }
    
    deinit {
        circleLayer.removeAllAnimations()
        circleLayer.removeFromSuperlayer()
    }
    
}
