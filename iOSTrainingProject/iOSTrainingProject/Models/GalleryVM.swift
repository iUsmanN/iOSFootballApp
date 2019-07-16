//
//  GalleryVM.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 16/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation

class GalleryVM : GalleryService
{
    var items: [GalleryItem]?
    {
        didSet
        {
            //should refresh collectionview
        }
    }
    
    func getData()
    {
        getGalleryData(completion: setItems(input:))
    }
    
    func setItems(input: [GalleryItem]?)
    {
        items = input
    }
}
