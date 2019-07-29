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
    let total                       : Int = 9
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
    
    /// Gets initial data from the Data manager
    func getData() {
        items = DataManager.shared.getGalleryItems()
    }
    
    /// Sets the input data into the model
    ///
    /// - Parameter input: Input data to be set to the model
    func setItems(input: [GalleryItem]) {
        items.append(contentsOf: input)
    }
    
    /// Returns the number of items in the model
    ///
    /// - Parameter section: Section (0 by default)
    /// - Returns: Number of items in the model
    func numberOfItemsInSection(_ section: Int) -> Int {
        return items.count
    }
    
    /// Returns the item at a specific index
    ///
    /// - Parameter indexPath: IndexPath of element to be fetched
    /// - Returns: Item for the given indexPath
    func galleryItem( at indexPath: IndexPath) -> GalleryItem {
        return items[indexPath.row]
    }
}
