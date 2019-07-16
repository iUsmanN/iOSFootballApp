//
//  Network Protocols.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 15/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation

protocol NetworkProtocol{
    func GetData<T: Decodable>(for ItemType: String, completionhandler: @escaping ([T])->())
}
