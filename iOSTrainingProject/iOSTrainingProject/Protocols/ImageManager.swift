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
    func loadImage(_ string: String) -> UIImage?
}

extension ImageManager {
    func loadImage(_ string: String) -> UIImage? {
        var returnImage: UIImage?
        DispatchQueue.global(qos: .background).async {
            if let url = URL(string: string) {
                do {
                    let data = try Data(contentsOf: url)
                    returnImage = UIImage(data: data)
                } catch {
                    print("Error in downloading images")
                }
            }
        }
        return returnImage
    }
}
