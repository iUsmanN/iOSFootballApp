//
//  NetworkLayer.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 15/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct NetworkLayer : NetworkProtocol
{
    func GetData<T>(for ItemType: String, completionhandler: @escaping ([T]) -> ()) where T : Decodable {
        let ref = Database.database().reference()
        ref.child(ItemType).observeSingleEvent(of: .value) { (datasnap) in
            if let startData = datasnap.value as? [AnyObject] {
                print(startData)
            }
            
            let data = try? JSONSerialization.data(withJSONObject: datasnap.value as Any)
            
            //DELETE THIS LATER ON
            print(String(data: data!, encoding: .utf8)!)
            
            if let data = data {
                do {
                    let item = try JSONDecoder().decode([T].self, from: data)
                    completionhandler(item)
                    print("OK")
                } catch {
                    print("JSON Decoder Error: ")
                    print (error)
                }
            }
        }
    }
}
