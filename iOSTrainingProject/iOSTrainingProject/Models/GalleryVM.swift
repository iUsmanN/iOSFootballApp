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
    
    var items = [GalleryItem]() {
        didSet {
            if let refreshCollectionViewClosure = refreshCollectionViewClosure {
                refreshCollectionViewClosure()
            }
        }
    }
    
    func getData() {
        items = DataManager.shared.getGalleryItems()
    }
    
    func setItems(input: [GalleryItem]) {
        items.append(contentsOf: input)
    }
    
    func numberOfItemsInSection(_ section: Int) -> Int {
        return items.count
    }
    
    func galleryItem( at indexPath: IndexPath) -> GalleryItem {
        return items[indexPath.row]
    }
}
