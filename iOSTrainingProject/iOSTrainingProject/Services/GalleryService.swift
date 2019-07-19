//
//  GalleryService.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 16/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation

protocol GalleryService : NetworkEngine {
    func getGalleryData(_ startingIndex: Int, _ amount:Int, completion: @escaping ([GalleryItem]) -> ())
}

extension GalleryService {
    func getGalleryData(_ startingIndex: Int, _ amount:Int, completion: @escaping ([GalleryItem]) -> ()) {
        addObserver(for: "Gallery", startingIndex, amount, completionhandler: completion)
    }
}
