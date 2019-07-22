//
//  GalleryVM.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 16/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation
import UIKit

class GalleryVM : GalleryService {
    let total                       : Int = 5
    var refreshCollectionViewClosure: (()->())?
    
    init(refreshColViewClosure: @escaping ()->()) {
        refreshCollectionViewClosure = refreshColViewClosure
    }
    
    var items: [GalleryItem]? {
        didSet {
            if let refreshCollectionViewClosure = refreshCollectionViewClosure {
                refreshCollectionViewClosure()
            }
        }
    }
    
    func getData() {
        getGalleryData(0, 6, completion: setItems(input:))
    }
    
    func setItems(input: [GalleryItem]) {
        items = input
    }
    
    func numberOfItemsInSection(_ section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func galleryItem( at indexPath: IndexPath) -> GalleryItem {
        return items?[indexPath.row] ?? GalleryItem(url: "", caption: "")
    }
}
