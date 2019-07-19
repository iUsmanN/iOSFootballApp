//
//  Colors.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 18/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import Foundation
import UIKit

protocol Color {
    func getColor(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ alpha: CGFloat) -> UIColor
}

extension Color {
    func getColor(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ alpha: CGFloat) -> UIColor {
        return UIColor(red: r, green: g, blue: b, alpha: alpha)
    }
}
