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
    let total           : Int = 10
    let networkLayer    : NetworkLayer = NetworkLayer()
    var items = [NewsFeedItem]() { didSet { print(items.count) }}
    
    func getData() {
        items = DataManager.shared.getNewsFeedItems()
    }
    
    func SetData(_ input: [NewsFeedItem]) {
        items.append(contentsOf: input)
        print("Items Set")
    }
    
    func numberOfItems(in section: Int) -> Int {
        return items.count
    }
    
    func itemAt(_ indexPath: IndexPath) -> NewsFeedItem {
        return items[indexPath.row]
    }
}
