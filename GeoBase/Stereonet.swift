//
//  Stereonet.swift
//  GeoBase
//
//  Created by Matt Wynyard on 22/04/15.
//  Copyright (c) 2015 Niobium. All rights reserved.
//

import UIKit

class Stereonet: UIView {
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.backgroundColor = UIColor.clearColor()
//    }
//    
//    required init(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 1.0)
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        
        let rectangle = CGRectMake(0,0,300,300)
        CGContextAddEllipseInRect(context, rectangle)
        CGContextStrokePath(context)
    }

}
