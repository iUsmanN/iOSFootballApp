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
        ref.child(ItemType).queryOrderedByKey().queryStarting(atValue:String(startingIndex)).queryEnding(atValue:String(startingIndex + amount - 1)).observeSingleEvent(of: .value) { (datasnap) in
            
            let data = try? JSONSerialization.data(withJSONObject: datasnap.value as AnyObject)
            
            if let data = data {
                do {
                    let item = try JSONDecoder().decode([T?].self, from: data)
                    let itemsfiltered = filterItems(item)
                    completionhandler(itemsfiltered)
                    print("OK")
                } catch {
                    print("JSON Decoder Error: ")
                    print (error)
                }
            }
        }
    }
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
