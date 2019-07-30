//
//  NetworkEngine.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 16/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.

import Foundation
import Firebase

protocol NetworkEngine {
    
    typealias Success<T> = ([T]) -> ()
    typealias Failure = (Error) -> ()
}

extension NetworkEngine {
    /// A generic function that returns an array of the requested datatype from the firebase database.
    ///
    /// - Parameters:
    ///   - ItemType: Defines the type of elements to be returned from the database
    ///   - startingIndex: Defines the starting index of the database query
    ///   - amount: Defines the number of Items to fetch from the databse
    ///   - completionhandler: A closure with parameter containing the returned values from the database.
    func addObserver<T>(for ItemType: String, _ startingIndex: Int, _ amount:Int, onSuccess: @escaping Success<T>, onFailure: @escaping Failure) where T : Decodable {
        let ref = Database.database().reference()
        ref.child(ItemType).queryOrderedByKey().queryStarting(atValue:String(startingIndex)).queryEnding(atValue:String(startingIndex + amount - 1))
            .observeSingleEvent(of: .value) { (datasnap) in
                var items:[T] = Array()
                do {
                    for child in datasnap.children.allObjects {
                        let snap            = child as! DataSnapshot
                        let data            = snap.value as! [String:Any]
                        let serializedData  = try JSONSerialization.data(withJSONObject: data)
                        let x               = try JSONDecoder().decode(T.self, from: serializedData)
                        items.append(x)
                        print("OK")
                    }
                    onSuccess(items);
                } catch {
                    print("ERROR")
                    print(error.localizedDescription)
                    onFailure(error)
                }
        }
    }
}

/// Filters out the null elements returned from the firebase query. This is important because Firebase returns NULL for all elements before the starting index of the query.
///
/// - Parameter input: Array containing NULL values
/// - Returns: Array without any NULL values
func filterItems<T>(_ input: [T?]) -> [T] {
    var res: [T] = Array()
    for x in input {
        if let x = x {
            res.append(x)
        }
    }
    return res
}


extension NetworkEngine {
    /// URL Session based query ("https://www.metaweather.com/api/location/search/?query=san") function to fetch data from www.metaweather.com
    ///
    /// - Parameter completion: A closure with parameter containing the returned values from the database
    func weatherQuery(completion: @escaping ([CityItem]?)->())
    {
        var items       : [CityItem]?
        let config      = URLSessionConfiguration.default
        let session     = URLSession(configuration: config)
        
        if let url = URL(string: "https://www.metaweather.com/api/location/search/?query=san") {
            _ = session.dataTask(with: url) {
                data, response, error in
                
                guard let data = data else { return }
                
                do {
                    items = try JSONDecoder().decode([CityItem].self, from: data)
                    completion(items)
                } catch {
                    print("Error fetching cities")
                }
                }.resume()
        }
    }
}
