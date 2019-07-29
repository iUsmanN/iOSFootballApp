//
//  VideoTVC.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 23/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class VideoTVC: UITableViewCell {
    
    //View variables
    @IBOutlet weak var videoHere    : YTPlayerView!
    @IBOutlet weak var title        : UILabel!
    @IBOutlet weak var blur         : UIVisualEffectView!
    
    //Object variables
    var item                        : NewsFeedItem?
    var shareDelegate               : ShareItemDelegate?
    var descriptionDelegate         : ShowDescriptionDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupCell()
        setupCALayer()
    }
    
    func setupCell() {
        if let videoUrl = item?.url {
            videoHere.load(withVideoId: videoUrl, playerVars: ["playsinline" : 1])
            videoHere.playVideo()
        }
        title.text = item?.title
    }
    
    @IBAction func shareButtonPressed(_ sender: Any) {
        shareDelegate?.newsFeedItemShared(input: item)
    }
    @IBAction func descriptionButtonPressed(_ sender: Any) {
        descriptionDelegate?.showDescription(input: item)
    }
}

extension VideoTVC {
    func setupCALayer() {
        blur.layer.cornerRadius = 20
        videoHere.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}
