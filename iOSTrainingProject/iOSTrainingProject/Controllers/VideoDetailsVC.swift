//
//  VideoDetailsVC.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 24/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class VideoDetailsVC: UIViewController {
    
    //View variables
    @IBOutlet weak var videoHere        : YTPlayerView!
    @IBOutlet weak var titleHere        : UILabel!
    @IBOutlet weak var descriptionHere  : UITextView!
    
    //Object variables
    var item                            : NewsFeedItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension VideoDetailsVC {
    
    /// Loads the values in the view
    func setupView() {
        titleHere.text          = item?.title
        descriptionHere.text    = item?.description
        if let videoUrl         = item?.url {
            videoHere.load(withVideoId: videoUrl, playerVars: ["playsinline" : 1])
        }
    }
}
