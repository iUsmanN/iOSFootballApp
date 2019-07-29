//
//  FactTVC.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 22/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import UIKit

class FactTVC: UITableViewCell, ImageManager {
    
    //View variables
    @IBOutlet weak var readMore         : UIButton!
    @IBOutlet weak var share            : UIButton!
    @IBOutlet weak var title            : UILabel!
    @IBOutlet weak var factImage        : UIImageView!
    
    //Object variables
    var item                            : NewsFeedItem?
    var shareDelegate                   : ShareItemDelegate?
    var descriptionDelegate             : ShowDescriptionDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupCell()
    }
    
    @IBAction func shareButtonPressed(_ sender: Any) {
        shareDelegate?.newsFeedItemShared(input: item)
    }
    
    @IBAction func descriptionButtonPresssed(_ sender: Any) {
        descriptionDelegate?.showDescription(input: item)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

extension FactTVC {
    func setupCell() {
        title.text = item?.title
        
        if let imageString = item?.url {
            ImageCache.shared.loadImage(imageString, completion: setImage(input:))
        }
    }
    
    func setImage(input: UIImage?) {
        DispatchQueue.main.async { self.factImage.image = input }
    }
}
