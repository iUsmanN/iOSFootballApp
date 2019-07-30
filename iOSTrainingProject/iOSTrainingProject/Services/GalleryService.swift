//
//  GalleryService.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 16/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation

protocol GalleryService : NetworkEngine { }

extension GalleryService {
    /// Gets Gallery data from the database
    ///
    /// - Parameters:
    ///   - startingIndex: Starting index of query
    ///   - amount: Number of items to be fetched
    ///   - completion: Closure with query data as parameters
    ///   - onSuccess: Success Closure
    ///   - onFailure: Failure Closure
    func getGalleryData(_ startingIndex: Int, _ amount:Int, onSuccess: @escaping TPConstants.Aliases.galleryServiceSuccess , onFailure: @escaping TPConstants.Aliases.galleryServiceFailure) {
        addObserver(for: "Gallery", startingIndex, amount, onSuccess: onSuccess, onFailure: onFailure)
    }
}
