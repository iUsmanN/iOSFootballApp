//
//  RankingTableViewCell.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 17/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import UIKit

class RankingTableViewCell: UITableViewCell, Color {
    
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
        
        
        DispatchQueue.global(qos: .background).async {
            if let f = URL(string: self.item?.flag ?? "")
            {
                do{
                    let data = try Data(contentsOf: f)
                    DispatchQueue.main.async { self.flag.image = UIImage(data: data) }
                } catch {
                    print("Error in loading data")
                }
            }
        }
        
        if let p = item?.position
        {
            if(p>0)
            {
                position.image = UIImage(named: "up")?.withRenderingMode(.alwaysTemplate)
                position.tintColor = getColor(0,0.7,0,1)
            } else if (p<0)
            {
                position.image = UIImage(named: "down")?.withRenderingMode(.alwaysTemplate)
                position.tintColor = getColor(0.7,0,0,1)
            } else {
                position.image = UIImage(named: "neutral")?.withRenderingMode(.alwaysTemplate)
                position.tintColor = getColor(0,0,0,1)
            }
        }
    }
    
}
