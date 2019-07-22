//
//  NewsFeedVM.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 15/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation
import FirebaseDatabase

class NewsFeedVM : NewsFeedService {
    let total       : Int = 10
    var items       : [NewsFeedItem]?
    let networkLayer: NetworkLayer = NetworkLayer()
    
    func getData() {
        getNFData(0, 10, completion: SetData(_:))
    }
    
    func SetData(_ input: [NewsFeedItem]) {
        items = input
        print("Items Set")
    }
}
