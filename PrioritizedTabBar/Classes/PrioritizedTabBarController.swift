//
//  PrioritizedTabBarController.swift
//
//  Created by Roman Churkin on 25.12.2019.
//  Copyright © 2019 Redmadrobot. All rights reserved.
//

import UIKit


class PrioritizedTabBarController: UITabBarController {
    override func viewDidLoad() {
      super.viewDidLoad()
      delegate = self
    }
}

extension PrioritizedTabBarController: UITabBarControllerDelegate  {
    
    func tabBarController(_ tabBarController: UITabBarController,
                          shouldSelect viewController: UIViewController) -> Bool {

        guard let fromView = selectedViewController?.view,
            let toView = viewController.view else {
          return false
        }

        if fromView != toView {
            UIView.transition(from: fromView,
                              to: toView,
                              duration: 0.4,
                              options: [.transitionCrossDissolve],
                              completion: nil)
        }

        return true
    }
    
}
