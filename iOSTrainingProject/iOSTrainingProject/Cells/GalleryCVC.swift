//
//  GalleryCollectionViewCell.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 17/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell, ImageManager {
    
    //View variables
    @IBOutlet weak var imagehere    : UIImageView!
    @IBOutlet weak var captionhere  : UILabel!
    
    //Object variables
    var delegate                    : DoubleTapDelegate?
    var item                        : GalleryItem? {
        didSet {
            setupCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCALayer()
        setupDoubleTap()
    }
    
    func setupCell() {
        if let url = item?.url {
            ImageCache.shared.loadImage(url, completion: setImage(input:))
        }
        captionhere.text = item?.caption
    }
    
    func setImage(input: UIImage?) {
        DispatchQueue.main.async { self.imagehere.image = input }
    }
}

extension GalleryCollectionViewCell {
    
    func setupDoubleTap() {
        let shareTap = UITapGestureRecognizer(target: self, action: #selector(getImage(recogniser:)))
        shareTap.numberOfTapsRequired = 2
        imagehere.addGestureRecognizer(shareTap)
        
    }
    
    @objc func getImage(recogniser: UIGestureRecognizer) {
        print("Share Image")
        let vc = UIActivityViewController(activityItems: [imagehere.image as Any], applicationActivities: [])
        delegate?.itemDoubleTapped(vc: vc)
    }
    
    func setupCALayer() {
        layer.cornerRadius = 10
        layer.shadowOffset = CGSize(width: 10, height: 10)
    }
    
    /// Used to remove image from cell when reusing
    override func prepareForReuse() {
        imagehere.image = nil
    }
}
