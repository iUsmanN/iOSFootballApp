//
//  ItemDetailsVC.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 24/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import UIKit
import SwiftLinkPreview

class ItemDetailsVC: UIViewController, ImageManager {

    //View variables
    @IBOutlet weak var imageHere        : UIImageView!
    @IBOutlet weak var titleHere        : UILabel!
    @IBOutlet weak var descriptionHere  : UITextView!
    
    //Object variables
    var item                            : NewsFeedItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension ItemDetailsVC {
    
    /// Sets up the view
    func setupView() {
        titleHere.text          = item?.title
        descriptionHere.text    = item?.description
        
        if item?.type == 2 {
            if let url = item?.url {
                ImageCache.shared.loadImage(url, completion: setImage(input:))
            }
        } else if item?.type == 3 {
            setUpNLItem()
        }
    }
    
    /// Loads the image for the veiw
    ///
    /// - Parameter input: Image to load
    func setImage(input: UIImage?) {
        DispatchQueue.main.async { self.imageHere.image = input }
    }
    
    /// Used to get the image of the News Link Item
    func setUpNLItem() {
        
        let swiftLinkPreviewObj = SwiftLinkPreview(
            session         : URLSession.shared,
            workQueue       : SwiftLinkPreview.defaultWorkQueue,
            responseQueue   : DispatchQueue.main,
            cache           : DisabledCache.instance)
        
        if let stringUrl    = item?.url {
            swiftLinkPreviewObj.preview(stringUrl, onSuccess: LinkPreviewSuccess(response:), onError: LinkPreviewFailure(error:))
        }
        titleHere.text      = item?.title
    }
    
    /// Swift Link Preview success closure
    ///
    /// - Parameter response: response returned by Swift Link Preview
    func LinkPreviewSuccess(response: Response) {
        if let imageString = response.image {
            ImageCache.shared.loadImage(imageString, completion: setImage(input:))
        }
    }
    
    /// Swift Link Preview failure closure
    ///
    /// - Parameter error: Error returned by the Swift Link Preview
    func LinkPreviewFailure(error: PreviewError) {
        print("Link preview error")
    }
}
