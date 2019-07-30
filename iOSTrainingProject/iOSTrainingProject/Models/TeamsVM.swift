//
//  TeamsVM.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 17/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation

class TeamsVM : TeamsService {
    
    let total: Int  = 20
    var items       = [RankingItem]() {
        didSet {
            if(items.count <= 20) {
                tableRefreshClosure?()
            }
        }
    }
    
    var tableRefreshClosure: (()->())?
    
    init(_ tableRefreshCl: @escaping (()->())) {
        tableRefreshClosure = tableRefreshCl
    }
    
    /// Gets initial data from the Data manager
    func getData() {
        items = DataManager.shared.getTeamItems()
    }
    
    /// Sets the input data into the model
    ///
    /// - Parameter input: Input data to be set to the model
    func setData(_ input: [RankingItem]) {
        items.append(contentsOf: input)
    }
    
    /// Returns the number of items in the model
    ///
    /// - Parameter section: Section (0 by default)
    /// - Returns: Number of items in the model
    func getNumberOfRows(for section: Int) -> Int {
        return items.count
    }
    
    /// Returns the item at a specific index
    ///
    /// - Parameter indexPath: IndexPath of element to be fetched
    /// - Returns: Item for the given indexPath
    func getItemForRow(at indexpath: IndexPath) -> RankingItem {
        return items[indexpath.row]
    }
    
    /// Manages the more data that needs to be get. NOT USED.
    ///
    /// - Parameter indexPath: current indexPath
    func getPaginatedData(indexPath: IndexPath) {
        print("indexPath: " + String(indexPath.row))
        
        if (items.count - indexPath.row == 2) {
            print("Getting data")
            getTeamsData(items.count, min(total - items.count, 3), onSuccess: setData(_:), onFailure: failureGettingData(_:))
        }
    }
    
    func failureGettingData(_ err: Error) {
        
    }
}
