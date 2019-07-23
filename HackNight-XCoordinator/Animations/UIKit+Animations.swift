//
//  UIKit+Animations.swift
//  HackNight-XCoordinator
//
//  Created by Paul Kraft on 02.07.19.
//  Copyright © 2019 QuickBird Studios. All rights reserved.
//

import UIKit

let defaultAnimationDuration: TimeInterval = 0.35

extension CGFloat {
    static let verySmall: CGFloat = 0.001
}

extension CGAffineTransform {
    mutating func rotate(by rotationAngle: CGFloat) {
        self = self.rotated(by: rotationAngle)
    }

    mutating func scale(by scalingFactor: CGFloat) {
        self = self.scaledBy(x: scalingFactor, y: scalingFactor)
    }
}
