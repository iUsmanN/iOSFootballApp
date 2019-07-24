//
//  NetworkEngine.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 16/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//queryStarting(atValue: "3").queryLimited(toFirst: 5).
//queryOrderedByKey().queryStarting(atValue: "2")

import Foundation
import Firebase

protocol NetworkEngine {
    func addObserver<T>(for ItemType: String, _ startingIndex: Int, _ amount:Int, completionhandler: @escaping ([T]) -> ()) where T : Decodable
}

extension NetworkEngine {
    func addObserver<T>(for ItemType: String, _ startingIndex: Int, _ amount:Int, completionhandler: @escaping ([T]) -> ()) where T : Decodable {
        let ref = Database.database().reference()
        ref.child(ItemType).queryOrderedByKey().queryStarting(atValue:String(startingIndex)).queryEnding(atValue:String(startingIndex + amount - 1))
            .observeSingleEvent(of: .value) { (datasnap) in
                var items:[T] = Array()
                do {
                    for child in datasnap.children.allObjects {
                        let snap = child as! DataSnapshot
                        let data = snap.value as! [String:Any]
                        let serializedData = try JSONSerialization.data(withJSONObject: data)
                        let x = try JSONDecoder().decode(T.self, from: serializedData)
                        items.append(x)
                        print("OK")
                    }
                    completionhandler(items);
                } catch {
                    print("ERROR")
                    print(error.localizedDescription)
                }
        }
    }
    
    //func loadImage(
}

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
    func weatherQuery(completion: @escaping ([CityItem]?)->())
    {
        var items: [CityItem]?
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
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
