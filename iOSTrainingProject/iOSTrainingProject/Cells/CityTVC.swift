//
//  CityTVC.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 24/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import UIKit

class CityTVC: UITableViewCell {

    //View variables
    @IBOutlet weak var nameHere         : UILabel!
    @IBOutlet weak var typeHere         : UILabel!
    @IBOutlet weak var latt_longHere    : UILabel!
    
    //Object variables
    var item                            : CityItem?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        guard let item      = item else { return }
        guard let name      = item.title else { return }
        guard let type      = item.location_type else { return }
        guard let latt      = item.latt_long else { return }
        
        nameHere.text       = name
        typeHere.text       = type
        latt_longHere.text  = latt
    }
}
