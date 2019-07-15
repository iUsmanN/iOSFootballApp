//
//  NewsFeedVM.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 15/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct NewsFeedVM
{
    var items:[NewsFeedItem]
    {
        didSet
        {
            //update tableview ?
        }
    }
    
    let networkLayer: NetworkLayer = NetworkLayer()
    
    mutating func getData()
    {
        let value = networkLayer.GetData(for: "NewsFeed")
        
        //Parse the data to fill the items array
//        var typedb: Type?
//        if let t = value?["age"] as? Int
//        {
//            typedb = Type(rawValue: t)
//        }
//        
//        let title_db = value?["title"] as? String ?? "ERR"
//        let desc_db = value?["desc"] as? String ?? "ERR"
//        let url_db = value?["url"] as? String ?? "ERR"
//        
//        items.append(NewsFeedItem(url: url_db, title: title_db, description: desc_db, type: typedb))
    }
}
