//
//  GalleryCollectionViewCell.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 17/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imagehere: UIImageView!
    @IBOutlet weak var captionhere: UILabel!
    @IBOutlet weak var Scroller: UIScrollView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        layer.cornerRadius = 10
        layer.shadowOffset = CGSize(width: 10, height: 10)
    }

}
