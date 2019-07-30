//
//  PlayersService.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 21/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation

protocol PlayersService : NetworkEngine { }

extension PlayersService {
    
    /// Gets Players data from the database
    ///
    /// - Parameters:
    ///   - startingIndex: Starting index of query
    ///   - amount: Number of items to be fetched
    ///   - onSuccess: Success Closure
    ///   - onFailure: Failure Closure
    func getPlayerData( _ startingIndex: Int, _ amount:Int, onSuccess: @escaping TPConstants.Aliases.playersServiceSuccess, onFailure: @escaping TPConstants.Aliases.playersServiceFailure) {
        addObserver(for: "Players", startingIndex, amount, onSuccess: onSuccess, onFailure: onFailure)
    }
}
