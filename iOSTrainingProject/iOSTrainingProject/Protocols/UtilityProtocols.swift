//
//  GalleryDelegate.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 23/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation
import UIKit

protocol DoubleTapDelegate {
    func itemDoubleTapped(vc:UIActivityViewController)
}

protocol ShareItemDelegate {
    func newsFeedItemShared(input:NewsFeedItem?)
}

protocol ShowDescriptionDelegate {
    func showDescription(input:NewsFeedItem?)
}
