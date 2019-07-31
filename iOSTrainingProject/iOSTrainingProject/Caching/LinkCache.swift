//
//  LinkCache.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 30/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation
import SwiftLinkPreview

enum Link {
    case image
    case title
    case description
}

struct LinkCache {
    static let shared   = LinkCache()
    let linkCache       = NSCache<NSString, NSString>()
    let titleCache      = NSCache<NSString, NSString>()
    let descCache       = NSCache<NSString, NSString>()
    
    var swiftLinkPreviewObj = SwiftLinkPreview(
        session         : URLSession.shared,
        workQueue       : SwiftLinkPreview.defaultWorkQueue,
        responseQueue   : DispatchQueue.main,
        cache           : DisabledCache.instance)
    
    private init() { }
    
    func loadLink(url: String, type: Link, onSuccess: @escaping (String?) -> ()){
    
        switch type {
        case .image:
            if let returnStr = linkCache.object(forKey: NSString(string: url)) as String? {
                onSuccess(returnStr)
            } else {
                addNewCacheObj(url: url, type: .image, onSuccess: onSuccess)
            }
            
        case .title:
            if let returnStr = titleCache.object(forKey: NSString(string: url)) as String? {
                onSuccess(returnStr)
            } else {
                addNewCacheObj(url: url, type: .title, onSuccess: onSuccess)
            }
            
        case .description:
            if let returnStr = descCache.object(forKey: NSString(string: url)) as String? {
                onSuccess(returnStr)
            } else {
                addNewCacheObj(url: url, type: .description, onSuccess: onSuccess)
            }
        }
    }
    
    func addNewCacheObj(url: String, type: Link, onSuccess: @escaping (String?) -> ()) {
        var returnStr: String?
        
        swiftLinkPreviewObj.preview(url, onSuccess: { r in
            
            guard let image = r.image else { return }
            self.linkCache.setObject(NSString(string: image), forKey: NSString(string: url))
            
            guard let title = r.title else { return }
            self.titleCache.setObject(NSString(string: title), forKey: NSString(string: url))
            
            guard let desc = r.description else { return }
            self.linkCache.setObject(NSString(string: desc), forKey: NSString(string: url))
            
            switch type {
            case .image:
                returnStr = self.linkCache.object(forKey: NSString(string: url)) as String?
                onSuccess(returnStr)
                
            case .title:
                returnStr = self.titleCache.object(forKey: NSString(string: url)) as String?
                onSuccess(returnStr)
                
            case .description:
                returnStr = self.descCache.object(forKey: NSString(string: url)) as String?
                onSuccess(returnStr)
            }
        }) { err in
            print(err.localizedDescription)
        }
    }
}
