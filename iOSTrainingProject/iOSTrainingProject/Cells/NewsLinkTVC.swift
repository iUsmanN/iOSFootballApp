//
//  NewsLinkTVC.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 23/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import UIKit
import SwiftLinkPreview

class NewsLinkTVC: UITableViewCell, ImageManager {
    
    @IBOutlet weak var imageHere        : UIImageView!
    @IBOutlet weak var titleHere        : UILabel!
    @IBOutlet weak var readMoreButton   : UIButton!
    @IBOutlet weak var shareButton      : UIButton!
    
    var item: NewsFeedItem?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        layer.borderWidth = CGFloat(5); layer.borderColor = UIColor.black.cgColor
        // Configure the view for the selected state
        setUpCell()
    }
    
    func setUpCell() {
        
        let swiftLinkPreviewObj = SwiftLinkPreview(
            session: URLSession.shared,
            workQueue: SwiftLinkPreview.defaultWorkQueue,
            responseQueue: DispatchQueue.main,
            cache: DisabledCache.instance)
        
        if let stringUrl = item?.url {
            swiftLinkPreviewObj.preview(stringUrl, onSuccess: LinkPreviewSuccess(response:), onError: LinkPreviewFailure(error:))
        }
        titleHere.text = item?.title
    }
    
    func LinkPreviewSuccess(response: Response) {
        if let imageString = response.image {
            loadImage(imageString, completion: setImage(input:))
        }
    }
    
    func LinkPreviewFailure(error: PreviewError) {
        print("Link preview error")
    }
    
    func setImage(input: UIImage?) {
        DispatchQueue.main.async { self.imageHere.image = input }
    }
}
