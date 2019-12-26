//
//  PrioritizedTabBar.swift
//
//  Created by Roman Churkin on 24.12.2019.
//  Copyright © 2019 Redmadrobot. All rights reserved.
//

import UIKit


class PrioritizedTabBar: UITabBar {
    
    
    // MARK: - Constants
    
    private enum Constants {
        
        static let itemWidth: CGFloat = 76
        static let itemHeight: CGFloat = 48
        
        static let indicatorSize: CGFloat = 4
        
        static let indicatorAnimationDuration: TimeInterval = 0.4
        static let indicatorAnimationStartPoint = CGPoint(x: 0.72, y: 0.08)
        static let indicatorAnimationEndPoint =  CGPoint(x: 0.12, y: 0.93)
        
    }
    
    
    // MARK: - Properties
    
    private lazy var indicator: UIView = {
        let circle = CircleView(frame: .zero)
        circle.backgroundColor = tintColor
        addSubview(circle)
        return circle
    }()
    
    private var buttons: [UIControl] {
        return subviews.filter { $0 is UIControl } as! [UIControl]
    }

    override var selectedItem: UITabBarItem? {
        didSet {
            guard let selectedItem = self.selectedItem,
                let index = items?.firstIndex(of: selectedItem) else { return }
            
            if let oldItem = oldValue,
                let oldIndex = items?.firstIndex(of: oldItem),
                index == oldIndex {
                return
            }
            
            animate(index: index)
        }
    }
    
    
    // MARK: - UITabBar
    
    override func tintColorDidChange() {
        super.tintColorDidChange()
        indicator.backgroundColor = tintColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let selectedItem = self.selectedItem,
            let index = items?.firstIndex(of: selectedItem) {
            indicator.frame = frame(forIndicatorAt: index)
        }
        
        guard let items = self.items, items.count <= 4 else { return }
        
        guard buttons.count > 0 else { return }
        
        for (index, button) in buttons.enumerated() {
            button.frame = frame(forButtonAt: index)
        }
    }
    
    
    // MARK: - Helper
    
    private func frame(forButtonAt buttonIndex: Int) -> CGRect {
        guard let items = self.items else { fatalError() }
        let itemsCount = items.count
        
        guard itemsCount <= 4 else {
            return buttons[buttonIndex].frame
        }
        
        let itemWidth: CGFloat = Constants.itemWidth
        let itemHeight: CGFloat = Constants.itemHeight

        let frame: CGRect
        if buttonIndex == 0 {
            frame = CGRect(x: 0, y: 0, width: itemWidth, height: itemHeight)
        } else {
            frame = CGRect(x: bounds.width - itemWidth * CGFloat(itemsCount - buttonIndex),
                           y: 0,
                           width: itemWidth,
                           height: itemHeight)
        }
        
        return frame
    }
    
    private func frame(forIndicatorAt index: Int) -> CGRect {
        let itemFrame = frame(forButtonAt: index)
        
        return CGRect(x: itemFrame.maxX - itemFrame.width/2 - Constants.indicatorSize/2,
                      y: itemFrame.maxY - Constants.indicatorSize/2,
                      width: Constants.indicatorSize,
                      height: Constants.indicatorSize)
    }
    
    
    // MARK: Animation
    
    private func animate(index: Int) {
        let newIndicatorFrame = frame(forIndicatorAt: index)
        
        let animator =
            UIViewPropertyAnimator(duration: Constants.indicatorAnimationDuration,
                                   controlPoint1: Constants.indicatorAnimationStartPoint,
                                   controlPoint2: Constants.indicatorAnimationEndPoint)
        
        animator.addAnimations {
            self.indicator.frame = newIndicatorFrame
        }
        
        animator.startAnimation()
    }
    
}
