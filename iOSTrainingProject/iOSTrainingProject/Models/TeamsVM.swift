//
//  TeamsVM.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 17/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation

class TeamsVM : TeamsService {
    let total: Int = 20
    var items = [RankingItem]() {
        didSet {
            if let tableRefreshClosure = tableRefreshClosure {
                tableRefreshClosure()
                print(items.count)
            }
        }
    }
    
    var tableRefreshClosure: (()->())?
    
    init(_ tableRefreshCl: @escaping (()->())) {
        tableRefreshClosure = tableRefreshCl
    }
    
    func getData() {
        getData(0, 13, completion: setData(_:))
    }
    
    func setData(_ input: [RankingItem]) {
        items.append(contentsOf: input)
    }
    
    func getNumberOfRows(for section: Int) -> Int {
        return items.count// ?? 0
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
            getData(items.count - 1, min(total - items.count, 5), completion: setData(_:))
        }
    }
}
