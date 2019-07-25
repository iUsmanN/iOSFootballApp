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
    var paginationClosure: (()->())?
    var first = true
    var cursor = 5
    
    func getData() {
        items = DataManager.shared.getNewsFeedItems()
    }
    
    func SetData(_ input: [NewsFeedItem]) {
        items.append(contentsOf: input)
        print("Items Set")
        if let closure = paginationClosure {
        closure()
        }
    }
    
    func numberOfItems(in section: Int) -> Int {
        return items.count
    }
    
    func itemAt(_ indexPath: IndexPath) -> NewsFeedItem {
        return items[indexPath.row]
    }
    
    func getPaginatedData(indexPath: IndexPath, completion: @escaping ()->()) {

        print("->" + String(indexPath.row) + ", " + String(items.count))
        
        if items.count < total, indexPath.row - items.count == -1 {
            if !first {
            print("-> Get Data")
            getNFData(items.count + 1, min(3, total-items.count), completion: SetData(_:))
            
            //setnumberofitems
            paginationClosure = completion
            } else {
                first = false
            }
        }
    }
}
