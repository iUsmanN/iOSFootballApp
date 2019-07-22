//
//  NewsFeedVM.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 15/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation
import FirebaseDatabase

class NewsFeedVM : NewsFeedService {
    let total       : Int = 10
    var items       : [NewsFeedItem]? { didSet { print(items?.count) }}
    let networkLayer: NetworkLayer = NetworkLayer()
    
    func getData() {
        items = DataManager.shared.getNewsFeedItems()
    }
    
    func SetData(_ input: [NewsFeedItem]) {
        items = input
        print("Items Set")
    }
}
