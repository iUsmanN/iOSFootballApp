//
//  GalleryVM.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 16/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation
import UIKit

class GalleryVM : GalleryService
{
    var refreshCollectionViewClosure: (()->())?
    
    init(refreshColViewClosure: @escaping ()->())
    {
        refreshCollectionViewClosure = refreshColViewClosure
    }
    
    var items: [GalleryItem]?
    {
        didSet
        {
            if let refreshCollectionViewClosure = refreshCollectionViewClosure
            {
                refreshCollectionViewClosure()
            }
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
    
    func numberOfItemsInSection(_ section: Int) -> Int
    {
        return items?.count ?? 0
    }
    
    func imageForUrl(at indexpath: IndexPath) -> UIImage?
    {
        if let url = URL(string: items?[indexpath.row].url ?? "")
        {
            do{
                let data = try Data(contentsOf: url)
                return UIImage(data: data)
            } catch {
                print("Error in loading data")
            }
        }
        return nil
    }
    
    func Caption(at indexpath: IndexPath) -> String
    {
        return items?[indexpath.row].caption ?? ""
    }
}
