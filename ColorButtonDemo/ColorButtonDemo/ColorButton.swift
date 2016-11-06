//
//  ColorButton.swift
//  ColorButtonDemo
//
//  Created by 翟怀楼 on 2016/11/6.
//  Copyright © 2016年 loulan. All rights reserved.
//

import UIKit

let π:CGFloat = CGFloat(M_PI)
var isButtonOn:Bool = false
var arcWidth: CGFloat = 20

@IBDesignable
class ColorButton: UIButton {
    @IBInspectable var counterColor: UIColor = UIColor.orange
    @IBInspectable var bool: Bool = false {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func awakeFromNib() {
        addTarget(self, action: #selector(start(_:forEvent:)), for: .touchDown)
    }
    
    func start(_ sender: AnyObject, forEvent event: UIEvent)
    {
        if bool == true {
            bool = false
            arcWidth = 40
        } else {
            bool = true
            arcWidth = 20
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        // 设置一个中心
        let center = CGPoint(x:bounds.width/2, y: bounds.height/2)
        
        // 设置半径
        let radius: CGFloat = max(bounds.width, bounds.height)
        
        // 设置圆的起始点终止点
        let startAngle: CGFloat = -π
        let endAngle: CGFloat = 4 * π
        
        // 绘制路径
        let path = UIBezierPath(arcCenter: center, radius: radius/2 - arcWidth/2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        // 其他的一些代码
        path.lineWidth = arcWidth
        counterColor.setStroke()
        path.stroke()
        
    }
}

