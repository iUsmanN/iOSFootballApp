//
//  TPConstants.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 26/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation
import UIKit

/// Constants
struct TPConstants {
    private init() { }
    
    struct Nibs {
        private init() { }
        static let FACT_TVC     = UINib(nibName: "FactTVC"      , bundle: nil)
        static let NEWS_TVC     = UINib(nibName: "NewsLinkTVC"  , bundle: nil)
        static let VIDEO_TVC    = UINib(nibName: "VideoTVC"     , bundle: nil)
        static let GALLERY_CVC  = UINib(nibName: "GalleryCVC"   , bundle: nil)
    }
    
    struct Pagination {
        private init() { }
        static let Amount       = 5
    }
    
    struct Aliases {
        private init() { }
        
        typealias newsfeedServiceFailure = (Error) -> ()
        typealias newsfeedServiceSuccess = ([NewsFeedItem]) -> ()
        
        typealias galleryServiceSuccess = ([GalleryItem])->()
        typealias galleryServiceFailure = (Error) -> ()
        
        typealias teamsServiceSuccess = ([RankingItem])->()
        typealias teamsServiceFailure = (Error) -> ()
        
        typealias playersServiceSuccess = ([PlayerItem])->()
        typealias playersServiceFailure = (Error) -> ()
    }
}
