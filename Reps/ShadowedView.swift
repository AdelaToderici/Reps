//
//  ShadowedView.swift
//  Reps
//
//  Created by Flex AI on 2019-01-11.
//  Copyright © 2019 Flex AI. All rights reserved.
//

import UIKit

class ShadowedView : UIView {
    
    //MARK: - Lifecycle method
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        self.layer.borderWidth = 0.5
        
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 9.0)
        self.layer.shadowRadius = 9.0
        self.layer.shadowOpacity = 0.4
    }
}

