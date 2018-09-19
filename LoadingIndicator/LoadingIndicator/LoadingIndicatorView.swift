//
//  LoadingIndicatorView.swift
//  LoadingIndicator
//
//  Created by Simon Elhoej Steinmejer on 19/09/18.
//  Copyright © 2018 Simon Elhoej Steinmejer. All rights reserved.
//

import UIKit

class LoadingIndicatorView: UIView
{
    internal lazy var percentageLabel: UILabel =
    {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = .white
        label.text = "Tap to\nstart"
        label.numberOfLines = 2
        
        return label
    }()
    
    internal var shapeLayer: CAShapeLayer!
    internal var pulsatingLayer: CAShapeLayer!
    internal var trackLayer: CAShapeLayer!
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        backgroundColor = .clear
        
        setupLayers()
        setupLabel()
    }
    
    private func setupLabel()
    {
        addSubview(percentageLabel)
        percentageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        percentageLabel.center = center
    }
    
    internal func setupLayers()
    {
        pulsatingLayer = createCircularShapeLayer(with: UIColor.clear.cgColor, fillColor: UIColor.red.cgColor)
        pulsatingLayer.opacity = 0.5
        layer.addSublayer(pulsatingLayer)
        
        trackLayer = createCircularShapeLayer(with: UIColor.lightGray.cgColor, fillColor: UIColor.init(red: 36/255, green: 36/255, blue: 36/255, alpha: 1.0).cgColor)
        layer.addSublayer(trackLayer)
        
        shapeLayer = createCircularShapeLayer(with: UIColor.red.cgColor, fillColor: UIColor.clear.cgColor)
        shapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        shapeLayer.strokeEnd = 0
        layer.addSublayer(shapeLayer)
    }
    
    internal func createCircularShapeLayer(with strokeColor: CGColor, fillColor: CGColor) -> CAShapeLayer
    {
        let layer = CAShapeLayer()
        
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 100, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        layer.path = circularPath.cgPath
        
        layer.strokeColor = strokeColor
        layer.lineWidth = 20
        layer.fillColor = fillColor
        layer.position = center
        
        return layer
    }
    
    internal func animatePulsatingLayer()
    {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        
        animation.toValue = 1.3
        animation.duration = 1.6
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.autoreverses = true
        animation.repeatCount = .infinity
        
        pulsatingLayer.add(animation, forKey: "pulsating")
    }
    
    
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
}


























