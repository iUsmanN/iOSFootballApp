//
//  NewsFeedItem.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 15/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation

enum Type: Int
{
    case Video = 1
    case Fact
    case NewsLink
}

struct NewsFeedItem
{
    var url: String?
    var title: String?
    var description: String?
    var type: Type?
}
