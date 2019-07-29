//
//  DetailsVC.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 21/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController, Color{
    
    //View variables
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var name             : UILabel!
    @IBOutlet weak var rank             : UILabel!
    @IBOutlet weak var points           : UILabel!
    @IBOutlet weak var pointsOrCountry  : UILabel!
    @IBOutlet weak var image            : UIImageView!
    @IBOutlet weak var position         : UILabel!
    @IBOutlet weak var positionImage    : UIImageView!
    @IBOutlet weak var descriptionLabel : UITextView!
    @IBOutlet weak var blurView         : UIVisualEffectView!
    
    //Object variables
    var item                            : HasDetails?
    var cellImage                       : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCALayer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupView()
    }
}

extension DetailsVC {
    
    /// Setups the details view
    func setupView() {
        image.image                 = cellImage
        backgroundImage.image       = cellImage
        
        if item is RankingItem {
            pointsOrCountry.text    = "Points"
            let rankingItem         = item as! RankingItem
            name.text               = rankingItem.name
            if let ranking          = rankingItem.ranking       { rank.text = String(ranking) }
            if let positionInput    = rankingItem.position      { showPosition(positionInput: positionInput) }
            if let description      = rankingItem.desc          { descriptionLabel.text = description }
            if let pointsto         = rankingItem.pointsto { points.text = String(pointsto) }
        }
        else if item is PlayerItem {
            pointsOrCountry.text    = "Country"
            let rankingItem         = item as! PlayerItem
            name.text               = rankingItem.name
            if let ranking          = rankingItem.ranking       { rank.text = String(ranking) }
            if let country          = rankingItem.country       { points.text = country }
            if let positionInput    = rankingItem.position      { showPosition(positionInput: positionInput) }
            if let description      = rankingItem.description   { descriptionLabel.text = description }
        }
    }
    
    /// Adds image to the ± position imageview
    ///
    /// - Parameter positionInput: ± value of position
    func showPosition(positionInput: Int) {
        if positionInput > 0 {
            position.text = "+" + String(positionInput)
            positionImage.image      = UIImage(named: "up")?.withRenderingMode(.alwaysTemplate)
            positionImage.tintColor  = getColor(0,1,0,1)
        } else if positionInput < 0 {
            position.text = String(positionInput)
            positionImage.image      = UIImage(named: "down")?.withRenderingMode(.alwaysTemplate)
            positionImage.tintColor  = getColor(1,0,0,1)
        } else {
            position.text = String(positionInput)
            positionImage.image      = UIImage(named: "neutral")?.withRenderingMode(.alwaysTemplate)
            positionImage.tintColor  = getColor(1,1,1,1)
        }
    }
}

extension DetailsVC {
    
    /// Sets up the CA Layer
    func setupCALayer() {
        blurView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}
