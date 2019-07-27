//
//  PlayersVM.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 21/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation

class PlayersVM: PlayersService {
    let total           : Int = 13
    var reloadTableView : (()->())?
    
    var items = [PlayerItem]() {
        didSet{
            print("Set player items")
            reloadTableView?()
        }
    }
    
    
    /// Gets initial data from the Data Manager
    ///
    /// - Parameter closure: Closure to reload the tableview when data is loaded
    func getData(closure: @escaping ()->()) {
        reloadTableView = closure
        items = DataManager.shared.getPlayerItems()
    }
    
    /// Sets the input data into the model
    ///
    /// - Parameter input: Input data to be set to the model
    func setData(_ input: [PlayerItem]) {
        items.append(contentsOf: input)
    }
    
    /// Returns the item at a specific index
    ///
    /// - Parameter indexPath: IndexPath of element to be fetched
    /// - Returns: Item for the given indexPath
    func getItem(at indexPath:IndexPath) -> PlayerItem {
        return items[indexPath.row]
    }
    
    /// Returns the number of items in the model
    ///
    /// - Parameter section: Section (0 by default)
    /// - Returns: Number of items in the model
    func getNumberOfRows(at section: Int) -> Int {
        return items.count
    }
}
