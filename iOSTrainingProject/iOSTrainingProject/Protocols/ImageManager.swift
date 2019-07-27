//
//  ImageManager.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 23/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation
import UIKit

protocol ImageManager {
    func downloadImage(_ string: String, completion: @escaping (UIImage?)->())
}

extension ImageManager {
    
    /// Downloads an image using native URL method in the background thread
    ///
    /// - Parameters:
    ///   - string: URL of iage
    ///   - completion: Closure called having the loaded image as parameter
    func downloadImage(_ string: String, completion: @escaping (UIImage?)->()) {
        
        DispatchQueue.global(qos: .background).async {
            if let url = URL(string: string) {
                do {
                    let data = try Data(contentsOf: url)
                    completion(UIImage(data:data))
                } catch {
                    print("Error in downloading images")
                }
            }
        }
    }
}
