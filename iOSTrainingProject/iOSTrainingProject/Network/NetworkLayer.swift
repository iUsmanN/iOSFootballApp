//
//  NetworkLayer.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 15/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct NetworkLayer : NetworkProtocol
{
    func GetData(for ItemType: String) -> NSDictionary? {
        let ref = Database.database().reference()
        var value:NSDictionary?
        ref.child(ItemType).observeSingleEvent(of: .value) { (data) in
            value = data.value as? NSDictionary
        }
        return value
    }
}
