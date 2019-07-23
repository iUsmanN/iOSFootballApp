//
//  FactTVC.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 22/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import UIKit

class FactTVC: UITableViewCell {

    @IBOutlet weak var readMore: UIButton!
    @IBOutlet weak var share: UIButton!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var factImage: UIImageView!
    
    var item: NewsFeedItem?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        title.text = item?.title
        factImage.image = getImage(item?.url)
    }
}

extension FactTVC {
    func getImage (_ s: String?) -> UIImage?
    {
        if let s = s {
            DispatchQueue.global(qos: .background).async {
                if let url = URL(string: s) {
                    do {
                        let data = try Data(contentsOf: url)
                        DispatchQueue.main.async { return UIImage(data: data) }
                    } catch {
                        print("Error in loading data")
                    }
                }
            }
        }
        return UIImage(named: "cat")
    }
}
