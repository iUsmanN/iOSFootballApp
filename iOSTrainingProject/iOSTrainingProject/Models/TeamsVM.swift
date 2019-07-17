//
//  TeamsVM.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 17/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation

class TeamsVM : TeamsService
{
    var items: [RankingItem]? {
        didSet{
            if let tableRefreshClosure = tableRefreshClosure
            {
                tableRefreshClosure()
            }
        }
    }
    
    var tableRefreshClosure: (()->())?
    
    init(_ tableRefreshCl: @escaping (()->()))
    {
        tableRefreshClosure = tableRefreshCl
    }
    
    func getData()
    {
        getData(completion: setData(_:))
    }
    
    func setData(_ input: [RankingItem]?)
    {
        items = input
    }
    
    func getNumberOfRows(for section: Int) -> Int
    {
        return items?.count ?? 0
    }
    
    func getItemForRow(at indexpath: IndexPath) -> RankingItem
    {
        return items?[indexpath.row] ?? RankingItem(ranking: -1, name: "NIL", pointsto: -1, pointsfrom: -1, position: -1, flag: "NIL")
    }
}
