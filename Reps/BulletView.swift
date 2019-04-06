//
//  BulletView.swift
//  Reps
//
//  Created by Flex AI on 2019-01-11.
//  Copyright © 2019 Flex AI. All rights reserved.
//

import UIKit

class BulletView: UIView {
    
    //MARK: - View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = self.bounds.width/2
    }
}

class BorderedView: UIView {
    
    //MARK: - View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 10.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor(red: 233.0/255.0, green: 233.0/255.0,  blue: 233.0/255.0, alpha: 1.0).cgColor
    }
}

