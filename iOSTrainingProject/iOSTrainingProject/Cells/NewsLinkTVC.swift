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
        print(response.image)
        
        DispatchQueue.global(qos: .background).async {
            if let url = URL(string: response.image ?? "") {
                do {
                    let data = try Data(contentsOf: url)
                    DispatchQueue.main.async { self.imageHere.image = UIImage(data: data) }
                } catch {
                    print("Error in downloading images")
                }
            }
        }
    }
    
    func LinkPreviewFailure(error: PreviewError) {
        print("Link preview error")
    }
}
