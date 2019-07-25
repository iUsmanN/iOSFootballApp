//
//  PlayersVM.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 21/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation

class PlayersVM: PlayersService {
    let total           : Int = 10
    var reloadTableView : (()->())?
    
    var items = [PlayerItem]() {
        didSet{
            print("Set player items")
            reloadTableView?()
        }
    }
    
    func getData(closure: @escaping ()->()) {
        reloadTableView = closure
        items = DataManager.shared.getPlayerItems()
    }
    
    func setData(_ input: [PlayerItem]) {
        items.append(contentsOf: input)
    }
    
    func getItem(at indexPath:IndexPath) -> PlayerItem {
        return items[indexPath.row]
    }
    
    func getNumberOfRows(at section: Int) -> Int {
        return items.count
    }
}
