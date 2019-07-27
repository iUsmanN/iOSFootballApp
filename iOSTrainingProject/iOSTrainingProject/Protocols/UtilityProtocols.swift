//
//  GalleryDelegate.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 23/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation
import UIKit

/// Delegate for double tapping the screen
protocol DoubleTapDelegate {
    func itemDoubleTapped(vc:UIActivityViewController)
}

/// Delegate for opening the action sheet for sharing
protocol ShareItemDelegate {
    func newsFeedItemShared(input:NewsFeedItem?)
}

/// Delegate for the segue to the description screen
protocol ShowDescriptionDelegate {
    func showDescription(input:NewsFeedItem?)
}
