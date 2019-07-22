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
            if(items.count <= 13) {
                if let tableRefreshClosure = tableRefreshClosure {
                    tableRefreshClosure()
                    print(items.count)
                }
            }
        }
    }
    
    var tableRefreshClosure: (()->())?
    
    init(_ tableRefreshCl: @escaping (()->())) {
        tableRefreshClosure = tableRefreshCl
    }
    
    func getData() {
        items = DataManager.shared.getTeamItems()
    }
    
    func setData(_ input: [RankingItem]) {
        items.append(contentsOf: input)
    }
    
    func getNumberOfRows(for section: Int) -> Int {
        return items.count
    }
    
    func getItemForRow(at indexpath: IndexPath) -> RankingItem {
        return items[indexpath.row]
    }
    
    func getPaginatedData(indexPath: IndexPath)
    {
        print("indexPath: " + String(indexPath.row))
        
        if (items.count - indexPath.row == 2)
        {
            print("Getting data")
            getData(items.count, min(total - items.count, 3), completion: setData(_:))
        }
    }
}
