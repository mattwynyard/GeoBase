//
//  SaveButton.swift
//  GeoBase
//
//  Created by Matt Wynyard on 30/04/15.
//  Copyright (c) 2015 Niobium. All rights reserved.
//

import Foundation
import UIKit

class SaveButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 5.0;
        self.layer.borderColor = UIColor.blackColor().CGColor
        self.layer.borderWidth = 1.5
        self.backgroundColor = UIColor.whiteColor()
        self.tintColor = UIColor.whiteColor()
    }
}