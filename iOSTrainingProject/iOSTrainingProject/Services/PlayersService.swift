//
//  PlayersService.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 21/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation

protocol PlayersService : NetworkEngine {
    func getData( _ startingIndex: Int, _ amount:Int, completion: @escaping ([PlayerItem])->())
}

extension PlayersService {
    /// Gets Players data from the database
    ///
    /// - Parameters:
    ///   - startingIndex: Starting index of query
    ///   - amount: Number of items to be fetched
    ///   - completion: Closure with query data as parameters
    func getData( _ startingIndex: Int, _ amount:Int, completion: @escaping ([PlayerItem])->()) {
        addObserver(for: "Players", startingIndex, amount, completionhandler: completion)
    }
}
