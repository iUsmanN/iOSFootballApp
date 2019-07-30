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
    
    /// Query to get city data
    func getCityData() {
      weatherQuery(completion: setItems(input:))
    }
    
    /// Function to set the data in the model
    ///
    /// - Parameter input: Array of items returned from the query
    func setItems(input: [CityItem]?) {
        if let input = input {
            items = input
        }
    }
    
    /// Returns the number of items in the model
    ///
    /// - Parameter section: Section (0 by default)
    /// - Returns: Number of items in the model
    func getNumberOfItems(at section: Int) -> Int {
        return items?.count ?? 0
    }
    
    /// Returns the item at a specific index
    ///
    /// - Parameter indexPath: IndexPath of element to be fetched
    /// - Returns: Item for the given indexPath
    func getItemAt(indexPath: IndexPath) -> CityItem? {
        return items?[indexPath.row]
    }
}
