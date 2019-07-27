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
        loadDataManager()
    }
    
    /// Sets up the data manager and gets initial data
    func loadDataManager() {
        DataManager.shared.getNewsFeedItems()
    }
}
