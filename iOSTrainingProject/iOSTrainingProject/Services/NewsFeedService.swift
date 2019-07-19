//
//  NewsFeedService.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 16/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation

protocol NewsFeedService : NetworkEngine {
    func getNFData(_ startingIndex: Int, _ amount:Int, completion:  @escaping ([NewsFeedItem]) -> ())
}

extension NewsFeedService {
    
    func getNFData(_ startingIndex: Int, _ amount:Int, completion:  @escaping ([NewsFeedItem]) -> ()) {
        addObserver(for: "NewsFeed", startingIndex, amount, completionhandler: completion)
    }
}
