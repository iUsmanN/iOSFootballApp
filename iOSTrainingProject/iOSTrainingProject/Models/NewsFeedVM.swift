//
//  NewsFeedVM.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 15/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation
import FirebaseDatabase

class NewsFeedVM : NewsFeedService
{
    var items: [NewsFeedItem]?
    
    let networkLayer: NetworkLayer = NetworkLayer()
    
    func getData()
    {
        getNFData("NewsFeed", completion: SetData(_:))
        //networkService("NewsFeed", completion: SetData(_:))
    }

    func networkService(_ nodeName: String, completion:  @escaping ([NewsFeedItem]?) -> ()) {
        
        networkLayer.GetData(for: nodeName, completionhandler: completion)
    }
    
    func SetData(_ input: [NewsFeedItem]?)
    {
        items = input
        print("Items Set")
    }
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func ParseData(_ data: Data?)
    {
        if let data = data
        {
            do{
                let j = try JSONDecoder().decode([NewsFeedItem].self, from: data)
                print("OK")
            } catch{
                print("Decoding Exception")
                print(error)
            }
        }
    }
    
    //functions to provide data to view controller
}
