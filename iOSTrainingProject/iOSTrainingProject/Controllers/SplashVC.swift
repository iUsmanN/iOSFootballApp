//
//  SplashVC.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 22/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        DataManager.shared.getNewsFeedItems()
        _ = DataManager.shared
    }
}
