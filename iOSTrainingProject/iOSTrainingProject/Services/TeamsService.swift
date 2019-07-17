//
//  TeamsService.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 17/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation

protocol TeamsService : NetworkEngine
{
    func getData(completion: @escaping ([RankingItem]?)->())
}

extension TeamsService
{
    func getData(completion: @escaping ([RankingItem]?)->())
    {
        GetData(for: "Teams", completionhandler: completion)
    }
}
