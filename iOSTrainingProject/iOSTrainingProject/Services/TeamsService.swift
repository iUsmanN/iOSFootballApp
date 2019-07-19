//
//  TeamsService.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 17/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation

protocol TeamsService : NetworkEngine {
    func getData( _ startingIndex: Int, _ amount:Int, completion: @escaping ([RankingItem])->())
}

extension TeamsService {
    func getData( _ startingIndex: Int, _ amount:Int, completion: @escaping ([RankingItem])->()) {
        addObserver(for: "Teams", startingIndex, amount, completionhandler: completion)
    }
}
