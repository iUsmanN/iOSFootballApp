//
//  GalleryService.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 16/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation

protocol GalleryService : NetworkEngine
{
    func getGalleryData(completion: @escaping ([GalleryItem]?) -> ())
}

extension GalleryService
{
    func getGalleryData(completion: @escaping ([GalleryItem]?) -> ())
    {
        GetData(for: "Gallery", completionhandler: completion)
    }
}
