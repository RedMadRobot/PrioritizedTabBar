//
//  RoundedView.swift
//
//  Created by Roman Churkin on 10/09/2019.
//  Copyright © 2019 Redmadrobot. All rights reserved.
//

import UIKit


protocol RoundedView: UIView {
    
    var cornerRadius: CGFloat { get set }
    
}


extension RoundedView {
    
    var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
}


final class CircleView: UIView, RoundedView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cornerRadius = min(bounds.width, bounds.height) / 2
    }
    
}
