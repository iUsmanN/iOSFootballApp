//
//  DataManager.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 22/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation
import UIKit

class DataManager : NewsFeedService, GalleryService, TeamsService, PlayersService {
    
    static let shared   = DataManager()
    var newsFeedItems   = [NewsFeedItem]()
    var galleryItems    = [GalleryItem]()
    var teamItems       = [RankingItem]()
    var playerItems     = [PlayerItem]()
    
    private init() {
        getNFData(0, 10, completion: setNewsFeedItems(_:))
        getGalleryData(0, 6, completion: setGalleryItems(_:))
        getData(0, 13, completion: setTeamItems(_:))
        getData(0, 13, completion: setPlayerItems(_:))
    }
    
    @discardableResult
    func getNewsFeedItems() -> [NewsFeedItem] {
        return newsFeedItems
    }
    
    func getGalleryItems() -> [GalleryItem] {
        return galleryItems
    }
    
    func getTeamItems() -> [RankingItem] {
        return teamItems
    }
    
    func getPlayerItems() -> [PlayerItem] {
        return playerItems
    }
    
    func setNewsFeedItems(_ input: [NewsFeedItem]) {
        newsFeedItems = input
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateInitialViewController() {
            (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController = vc
        }
    }
    
    func setGalleryItems(_ input: [GalleryItem]) {
        galleryItems = input
    }
    
    func setTeamItems(_ input: [RankingItem]) {
        teamItems = input
    }
    
    func setPlayerItems(_ input: [PlayerItem]) {
        playerItems = input
    }
}
