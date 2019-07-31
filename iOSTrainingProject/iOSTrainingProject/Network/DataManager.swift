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
    
    /// Getting initial data for all tabs
    private init() {
        getNFData       (0, 4,      onSuccess: setNewsFeedItems(_:),    onFailure: failureGettingData(_:))
        getGalleryData  (0, 12,     onSuccess: setGalleryItems(_:),     onFailure: failureGettingData(_:))
        getTeamsData    (0, 20,     onSuccess: setTeamItems(_:),        onFailure: failureGettingData(_:))
        getPlayerData   (0, 13,     onSuccess: setPlayerItems(_:),      onFailure: failureGettingData(_:))
    }
    
    @discardableResult
    /// Returns the initial News Feed items
    ///
    /// - Returns: Array of Initial NewsFeed Items
    func getNewsFeedItems() -> [NewsFeedItem] {
        return newsFeedItems
    }
    
    /// Returns the initial Gallery items
    ///
    /// - Returns: Array of initial Gallery items
    func getGalleryItems() -> [GalleryItem] {
        return galleryItems
    }
    
    /// Returns the initial Teams items
    ///
    /// - Returns: Array of initial Team items
    func getTeamItems() -> [RankingItem] {
        return teamItems
    }
    
    /// Returns the initial Player items
    ///
    /// - Returns: Array of initial Player items
    func getPlayerItems() -> [PlayerItem] {
        return playerItems
    }
    
    /// Function used to set the initial NewsFeed items
    ///
    /// - Parameter input: Array of initial NewsFeed items
    func setNewsFeedItems(_ input: [NewsFeedItem]) {
        newsFeedItems   = input
        let main        = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateInitialViewController() {
            (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController = vc
        }
    }
    
    /// Function used to set the initial NewsFeed items
    ///
    /// - Parameter input: Array of initial Gallery items
    func setGalleryItems(_ input: [GalleryItem]) {
        galleryItems = input
    }
    
    /// Function used to set the initial Team items
    ///
    /// - Parameter input: Array of initial Team items
    func setTeamItems(_ input: [RankingItem]) {
        teamItems = input
    }
    
    /// Function used to set the initial Team items
    ///
    /// - Parameter input: Array of initial Player items
    func setPlayerItems(_ input: [PlayerItem]) {
        playerItems = input
    }
    
    func failureGettingData(_ err: Error) {
        print("Error")
        print(err.localizedDescription)
    }
}
