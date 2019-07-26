//
//  TPConstants.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 26/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation
import UIKit

struct TPConstants {
    private init() { }
    
    struct Nibs {
        private init() { }
        static let FACT_TVC     = UINib(nibName: "FactTVC", bundle: nil)
        static let NEWS_TVC     = UINib(nibName: "NewsLinkTVC", bundle: nil)
        static let VIDEO_TVC    = UINib(nibName: "VideoTVC", bundle: nil)
        static let GALLERY_CVC  = UINib(nibName: "GalleryCVC", bundle: nil)
    }
}
