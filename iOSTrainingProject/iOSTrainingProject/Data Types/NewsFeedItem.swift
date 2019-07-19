//
//  NewsFeedItem.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 15/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation

struct NewsFeedItem : Decodable {
    var url         : String?
    var title       : String?
    var description : String?
    var type        : Int?
}
