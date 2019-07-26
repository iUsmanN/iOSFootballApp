//
//  imageCache.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 25/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation
import UIKit

struct ImageCache : ImageManager {
    static let shared   = ImageCache()
    let imageCache      = NSCache<NSString, UIImage>()
    
    private init() { }
    
    func loadImage(_ string: String, completion: @escaping (UIImage?) -> ()) {
        
        if let cachedImage = imageCache.object(forKey: string as NSString) {
            completion(cachedImage)
        } else {
            downloadImage(string) { (input) in
                if let input = input {
                    self.imageCache.setObject(input, forKey: string as NSString)
                    completion(input)
                }
            }
        }
    }
}
