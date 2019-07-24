//
//  ItemDetailsVC.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 24/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import UIKit

class ItemDetailsVC: UIViewController, ImageManager {

    @IBOutlet weak var imageHere: UIImageView!
    @IBOutlet weak var titleHere: UILabel!
    @IBOutlet weak var descriptionHere: UITextView!
    
    var item: NewsFeedItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleHere.text = item?.title
        descriptionHere.text = item?.description
        
        if item?.type == 2 {
            if let url = item?.url {
            loadImage(url, completion: setImage(input:))
            }
        }
    }
    
    func setImage(input: UIImage?) {
        DispatchQueue.main.async { self.imageHere.image = input }
    }
}