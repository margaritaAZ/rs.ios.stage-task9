//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Маргарита Жучик
// On: 1.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class StoryImageView: UIView {
    var path: CGPath!
    var shapeLayer:CAShapeLayer!
    
    func initWithPath(_ path: CGPath) {
        self.path = path
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 3
        animation.fromValue = 0
        animation.toValue = 1
        
        shapeLayer = CAShapeLayer()
        shapeLayer.path = path
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = UIColor.init(named: "#F3AF22")?.cgColor
        shapeLayer.add(animation, forKey: "strokeEnd")
        self.layer.addSublayer(shapeLayer)
    }

}
