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
    func getData( _ startingIndex: Int, _ amount:Int, completion: @escaping ([PlayerItem])->()) {
        addObserver(for: "Players", startingIndex, amount, completionhandler: completion)
    }
}
