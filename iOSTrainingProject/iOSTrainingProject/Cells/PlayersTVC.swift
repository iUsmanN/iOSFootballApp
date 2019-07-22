//
//  PlayersTVC.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 21/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import UIKit

class PlayersTVC: UITableViewCell, Color {

    var item: PlayerItem?
    
    @IBOutlet weak var flag     : UIImageView!
    @IBOutlet weak var ranking  : UILabel!
    @IBOutlet weak var teamName : UILabel!
    @IBOutlet weak var position : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print("super.awakeFromNib()")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        //Set Rank
        if let rank = item?.ranking {
            ranking.text = String(rank)
        }
        
        //Set Name
        if let name = item?.name {
            teamName.text = name
        }
        
        //Set Flag image
        DispatchQueue.global(qos: .background).async {
            if let flag = URL(string: self.item?.image ?? "") {
                do {
                    let data = try Data(contentsOf: flag)
                    DispatchQueue.main.async { self.flag.image = UIImage(data: data) }
                } catch {
                    print("Error in loading data")
                }
            }
        }
        
        //Set position image
        if let pos = item?.position
        {
            if(pos>0) {
                position.image      = UIImage(named: "up")?.withRenderingMode(.alwaysTemplate)
                position.tintColor  = getColor(0,0.7,0,1)
            } else if (pos<0) {
                position.image      = UIImage(named: "down")?.withRenderingMode(.alwaysTemplate)
                position.tintColor  = getColor(0.7,0,0,1)
            } else {
                position.image      = UIImage(named: "neutral")?.withRenderingMode(.alwaysTemplate)
                position.tintColor  = getColor(0,0,0,1)
            }
        }
    }

}
