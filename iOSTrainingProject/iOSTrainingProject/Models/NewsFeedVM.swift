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
    let total           : Int = 13
    let networkLayer    : NetworkLayer = NetworkLayer()
    var items = [NewsFeedItem]() { didSet { print(items.count) }}
    var paginationClosure: ((Int)->())?
    
    
    /// Gets initial data from the data manager
    ///
    /// - Parameter pagination: sets the pagination closure for next data appends
    func getData(pagination: @escaping (Int)->()) {
        items = DataManager.shared.getNewsFeedItems()
        paginationClosure = pagination
    }
    
    
    /// Sets the input data into the model
    ///
    /// - Parameter input: Input data to be set to the model
    func SetData(_ input: [NewsFeedItem]) {
        items.append(contentsOf: input)
        print("Items Set")
        if let closure = paginationClosure, input.count > 0 {
            closure(input.count)
        }
    }
    
    /// Returns the number of items in the model
    ///
    /// - Parameter section: Section (0 by default)
    /// - Returns: Number of items in the model
    func numberOfItems(in section: Int) -> Int {
        return items.count
    }
    
    /// Returns the item at a specific index
    ///
    /// - Parameter indexPath: IndexPath of element to be fetched
    /// - Returns: Item for the given indexPath
    func itemAt(_ indexPath: IndexPath) -> NewsFeedItem {
        return items[indexPath.row]
    }
    
    
    /// Manages the more data that needs to be get
    ///
    /// - Parameter indexPath: current indexPath
    func getPaginatedData(indexPath: IndexPath) {
        if items.count < total, indexPath.row - items.count == -1 {
            print("-> Get Data")
            print(String(TPConstants.Pagination.Amount) + ", " + String(total-items.count))
            getNFData(items.count + 1, min(TPConstants.Pagination.Amount, total-items.count), onSuccess: SetData(_:), onFailure: failureGettingData(_:))
        }
    }
    
    func failureGettingData(_ err: Error) {
        
    }
}
