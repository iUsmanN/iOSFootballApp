//
//  RankingTableViewCell.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 17/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import UIKit

class RankingTableViewCell: UITableViewCell {

    var item: RankingItem?
    
    @IBOutlet weak var ranking: UILabel!
    @IBOutlet weak var flag: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var position: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        if let r = item?.ranking
        {
            ranking.text = String(r)
        }
        
        if let n = item?.name
        {
            teamName.text = n
        }
        
    }

}
