//
//  GalleryCollectionViewCell.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 17/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imagehere    : UIImageView!
    @IBOutlet weak var captionhere  : UILabel!
    @IBOutlet weak var Scroller     : UIScrollView!
    
    var item: GalleryItem? {
        didSet {
            setupCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        layer.cornerRadius = 10
        layer.shadowOffset = CGSize(width: 10, height: 10)
    }
    
  
    func setupCell() {
        var url: URL?
        
        DispatchQueue.global(qos: .background).async { url = URL(string: self.item?.url ?? "")
            if let url = url {
                do {
                    let data = try Data(contentsOf: url)
                    DispatchQueue.main.async { self.imagehere.image =  UIImage(data: data) }
                } catch {
                    print("Error in loading data")
                }
            }
        }
        captionhere.text = item?.caption
    }
}
