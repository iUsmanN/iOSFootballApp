//
//  FactTVC.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 22/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import UIKit

class FactTVC: UITableViewCell, ImageManager {
    
    @IBOutlet weak var readMore: UIButton!
    @IBOutlet weak var share: UIButton!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var factImage: UIImageView!
    
    var item: NewsFeedItem?
    var shareDelegate: ShareItemDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        layer.borderWidth = CGFloat(5); layer.borderColor = UIColor.black.cgColor
        // Configure the view for the selected state
        setupCell()
    }
    
    @IBAction func shareButtonPressed(_ sender: Any) {
        shareDelegate?.newsFeedItemShared(input: item)
    }
    
}

extension FactTVC {
    func setupCell() {
        title.text = item?.title
        
        if let imageString = item?.url
        {
            loadImage(imageString, completion: setImage(input:))
        }
    }
    
    func setImage(input: UIImage?) {
        DispatchQueue.main.async { self.factImage.image = input }
    }
}
