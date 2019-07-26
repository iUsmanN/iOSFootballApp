//
//  CityItem.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 24/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation

struct CityItem         : Codable {
    var title           : String?
    var location_type   : String?
    var woeid           : Int?
    var latt_long       : String?
}
