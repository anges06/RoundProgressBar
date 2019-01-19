//
//  ProgressBar.swift
//  RoundProgressBar
//
//  Created by anges on 19.01.19.
//  Copyright © 2019 anges. All rights reserved.
//

import UIKit

class ProgressBar: UIView {

    var background: UIBezierPath!
    var shapeLayer: CAShapeLayer!
    var progressLayer: CAShapeLayer!
    
    var progress: Float = 0
    {
        willSet(Value)
        {
            progressLayer.strokeEnd = CGFloat(Value)
        }
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        background = UIBezierPath()
        self.Shape()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        background = UIBezierPath()
        self.Shape()
    }
    
    func Shape()
    {
        createCircle()
        
        shapeLayer = CAShapeLayer()
        shapeLayer.path = background.cgPath
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = UIColor.lightText.cgColor
        
        progressLayer = CAShapeLayer()
        progressLayer.path = background.cgPath
        progressLayer.lineCap = CAShapeLayerLineCap.round
        progressLayer.lineWidth = 10
        progressLayer.fillColor = nil
        progressLayer.strokeColor = UIColor.red.cgColor
        progressLayer.strokeEnd = 0.0
        
        self.layer.addSublayer(shapeLayer)
        self.layer.addSublayer(progressLayer)
    }
    
    private func createCircle()
    {
        let x = self.frame.width / 2
        let y = self.frame.height / 2
        let center = CGPoint(x: x, y: y)
        let AddRadius: CGFloat = 30
        
        background.addArc(withCenter: center, radius: x/CGFloat(2) + AddRadius, startAngle: CGFloat(-1.5), endAngle: CGFloat(4.78), clockwise: true)
        background.close()
    }
}
