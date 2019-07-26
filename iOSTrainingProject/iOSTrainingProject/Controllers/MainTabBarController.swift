//
//  MainTabBarController.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 15/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
}

extension MainTabBarController: UITabBarControllerDelegate
{
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        guard let fromView = selectedViewController?.view, let toView = viewController.view else {
            return false // Make sure you want this as false
        }
        
        if fromView != toView {
            UIView.transition(from: fromView, to: toView, duration: 0.3, options: [.curveEaseInOut], completion: nil)
        }
        return true
    }
}

