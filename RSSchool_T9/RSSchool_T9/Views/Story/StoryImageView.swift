//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Маргарита Жучик
// On: 1.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

@objc class StoryImageView: UIView {
    @objc public static var color: UIColor = UIColor(named: "#F3AF22")!
    @objc public static var isAnimated: Bool = true
    var path: CGPath!
    var shapeLayer:CAShapeLayer!
    
    
    func initWithPath(_ path: CGPath) {
        self.path = path
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
         drawPath()
    }
    
    func drawPath() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = StoryImageView.isAnimated ? 3 : 0
        animation.fromValue = 0
        animation.toValue = 1
        
        shapeLayer = CAShapeLayer()
        shapeLayer.path = path
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = StoryImageView.color.cgColor
        shapeLayer.add(animation, forKey: "strokeEnd")
        self.layer.addSublayer(shapeLayer)
    }

}
