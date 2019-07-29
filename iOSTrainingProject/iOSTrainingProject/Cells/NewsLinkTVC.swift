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
    
    //View variables
    @IBOutlet weak var imageHere        : UIImageView!
    @IBOutlet weak var titleHere        : UILabel!
    
    //Object variables
    var item                            : NewsFeedItem?
    var shareDelegate                   : ShareItemDelegate?
    var descriptionDelegate             : ShowDescriptionDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setUpCell()
    }
    
    func setUpCell() {
        
        let swiftLinkPreviewObj = SwiftLinkPreview(
            session         : URLSession.shared,
            workQueue       : SwiftLinkPreview.defaultWorkQueue,
            responseQueue   : DispatchQueue.main,
            cache           : DisabledCache.instance)
        
        if let stringUrl = item?.url {
            swiftLinkPreviewObj.preview(stringUrl, onSuccess: LinkPreviewSuccess(response:), onError: LinkPreviewFailure(error:))
        }
        titleHere.text = item?.title
    }
    
    func LinkPreviewSuccess(response: Response) {
        if let imageString = response.image {
            ImageCache.shared.loadImage(imageString, completion: setImage(input:))
        }
    }
    
    func LinkPreviewFailure(error: PreviewError) {
        print("Link preview error")
    }
    
    func setImage(input: UIImage?) {
        DispatchQueue.main.async { self.imageHere.image = input }
    }
    
    @IBAction func shareButtonPressed(_ sender: Any) {
        shareDelegate?.newsFeedItemShared(input: item)
    }
    
    @IBAction func descriptionButtonPressed(_ sender: Any) {
        descriptionDelegate?.showDescription(input: item)
    }
}
