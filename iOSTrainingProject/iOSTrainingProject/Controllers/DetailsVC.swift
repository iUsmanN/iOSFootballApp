//
//  DetailsVC.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 21/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController, Color{

    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var name             : UILabel!
    @IBOutlet weak var rank             : UILabel!
    @IBOutlet weak var points           : UILabel!
    @IBOutlet weak var pointsOrCountry  : UILabel!
    @IBOutlet weak var image            : UIImageView!
    @IBOutlet weak var position         : UILabel!
    @IBOutlet weak var positionImage    : UIImageView!
    @IBOutlet weak var descriptionLabel : UITextView!
    
    var item: HasDetails?
    var cellImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        image.image = cellImage
        backgroundImage.image = cellImage
        
        if item is RankingItem {
            let rankingItem = item as! RankingItem
            name.text = rankingItem.name
            if let ranking = rankingItem.ranking { rank.text = String(ranking) }
            pointsOrCountry.text = "Points :"
            if let pointsto = rankingItem.pointsto, let pointsfrom = rankingItem.pointsfrom {
                points.text = String(pointsfrom) + " -> " + String(pointsto)
            }
            if let pos = rankingItem.position {
                if pos > 0 {
                    position.text = "+" + String(pos)
                    positionImage.image      = UIImage(named: "up")?.withRenderingMode(.alwaysTemplate)
                    positionImage.tintColor  = getColor(0,0.7,0,1)
                } else if pos < 0 {
                    position.text = String(pos)
                    positionImage.image      = UIImage(named: "down")?.withRenderingMode(.alwaysTemplate)
                    positionImage.tintColor  = getColor(0.7,0,0,1)
                } else {
                    position.text = String(pos)
                    positionImage.image      = UIImage(named: "neutral")?.withRenderingMode(.alwaysTemplate)
                    positionImage.tintColor  = getColor(0.3,0.3,0.3,1)
                }
            }
            if let description = rankingItem.desc {
                descriptionLabel.text = description
            }
        } else if item is PlayerItem {
            let rankingItem = item as! PlayerItem
            name.text = rankingItem.name
            if let ranking = rankingItem.ranking { rank.text = String(ranking) }
            pointsOrCountry.text = "Country :"
            if let country = rankingItem.country { points.text = country }
            if let pos = rankingItem.position {
                if pos > 0 {
                    position.text = "+" + String(pos)
                    positionImage.image      = UIImage(named: "up")?.withRenderingMode(.alwaysTemplate)
                    positionImage.tintColor  = getColor(0,1,0,1)
                } else if pos < 0 {
                    position.text = String(pos)
                    positionImage.image      = UIImage(named: "down")?.withRenderingMode(.alwaysTemplate)
                    positionImage.tintColor  = getColor(1,0,0,1)
                } else {
                    position.text = String(pos)
                    positionImage.image      = UIImage(named: "neutral")?.withRenderingMode(.alwaysTemplate)
                    positionImage.tintColor  = getColor(0,0,0,1)
                }
            }
            if let description = rankingItem.description {
                descriptionLabel.text = description
            }
        }
    }
}
