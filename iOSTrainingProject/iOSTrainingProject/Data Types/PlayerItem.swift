//
//  PlayerItem.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 21/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation

struct PlayerItem       : Decodable, HasDetails {
    var name            : String?
    var country         : String?
    var description     : String?
    var image           : String?
    var ground          : Int?
    var position        : Int?
    var ranking         : Int?
}
