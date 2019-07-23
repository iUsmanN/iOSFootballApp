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
    func loadImage(_ string: String, completion: @escaping (UIImage?)->())
}

extension ImageManager {
    func loadImage(_ string: String, completion: @escaping (UIImage?)->()) {
        
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
