//
//  TeamsService.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 17/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation

protocol TeamsService : NetworkEngine {
    
}

extension TeamsService {
    /// Gets Teams data from the database
    ///
    /// - Parameters:
    ///   - startingIndex: Starting index of query
    ///   - amount: Number of items to be fetched
    ///   - completion: Closure with query data as parameters
    ///   - onSuccess: Success Closure
    ///   - onFailure: Failure Closure
    func getTeamsData( _ startingIndex: Int, _ amount:Int, onSuccess: @escaping TPConstants.Aliases.teamsServiceSuccess, onFailure: @escaping TPConstants.Aliases.teamsServiceFailure) {
        addObserver(for: "Teams", startingIndex, amount, onSuccess: onSuccess, onFailure: onFailure)
    }
}
