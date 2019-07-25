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
    var paginationClosure: ((Int)->())?
    
    func getData(pagination: @escaping (Int)->()) {
        items = DataManager.shared.getNewsFeedItems()
        paginationClosure = pagination
    }
    
    func SetData(_ input: [NewsFeedItem]) {
        items.append(contentsOf: input)
        print("Items Set")
        if let closure = paginationClosure {
            closure(input.count)
        }
    }
    
    func numberOfItems(in section: Int) -> Int {
        return items.count
    }
    
    func itemAt(_ indexPath: IndexPath) -> NewsFeedItem {
        return items[indexPath.row]
    }
    
    func getPaginatedData(indexPath: IndexPath) {
        if items.count < total, indexPath.row - items.count == -1 {
            print("-> Get Data")
            getNFData(items.count + 1, min(2, total-items.count), completion: SetData(_:))
        }
    }
}
