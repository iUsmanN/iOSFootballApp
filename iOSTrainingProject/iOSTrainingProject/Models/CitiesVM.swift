//
//  CitiesVM.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 24/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation

class CitiesVM : NetworkEngine {
    var items: [CityItem]? {
        didSet {
            guard let reloadclosure = reloadclosure else { return }
            reloadclosure()
        }
    }
    var reloadclosure: (() -> ())?
    
    init(closure: @escaping ()->()) {
        reloadclosure = closure
    }
    
    func getCityData()
    {
      weatherQuery(completion: setItems(input:))
    }
    
    func setItems(input: [CityItem]?)
    {
        if let input = input {
            items = input
        }
    }
    
    func getNumberOfItems(at section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func getItemAt(indexPath: IndexPath) -> CityItem? {
        return items?[indexPath.row]
    }
}
