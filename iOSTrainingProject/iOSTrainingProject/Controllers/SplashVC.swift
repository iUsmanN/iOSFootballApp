//
//  SplashVC.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 22/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import UIKit
import Lottie

class SplashVC: UIViewController {

    //View variables
    @IBOutlet weak var animView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataManager()
        loadAnimation()
    }
    
    /// Sets up the data manager and gets initial data
    func loadDataManager() {
        DataManager.shared.getNewsFeedItems()
    }
    
    /// Sets up the loading animation in the splash screen
    func loadAnimation() {
        let animation = Animation.named("1803-continuous-wave-loader")
        animView.animation = animation
        animView.loopMode = LottieLoopMode.loop
        animView.play()
    }
}
