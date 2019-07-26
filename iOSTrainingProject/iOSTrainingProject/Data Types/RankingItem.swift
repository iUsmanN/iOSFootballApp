//
//  RankingItem.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 17/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation

struct RankingItem  : Decodable, HasDetails {
    var ranking     : Int?
    var name        : String?
    var pointsto    : Int?
    var pointsfrom  : Int?
    var position    : Int?
    var flag        : String?
    var desc        : String?
}
