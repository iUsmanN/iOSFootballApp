//
//  NewsFeedService.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 16/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation

protocol NewsFeedService : NetworkEngine { }

extension NewsFeedService {
    
    /// Gets NewsFeed data from the database
    ///
    /// - Parameters:
    ///   - startingIndex: Starting index of query
    ///   - amount: Number of items to be fetched
    ///   - completion: Closure with query data as parameters
    ///   - onSuccess: Success Closure
    ///   - onFailure: Failure Closure
    func getNFData(_ startingIndex: Int, _ amount:Int, onSuccess:  @escaping TPConstants.Aliases.newsfeedServiceSuccess, onFailure: @escaping TPConstants.Aliases.newsfeedServiceFailure ) {
        addObserver(for: "NewsFeed", startingIndex, amount, onSuccess: onSuccess, onFailure: onFailure)
    }
}
