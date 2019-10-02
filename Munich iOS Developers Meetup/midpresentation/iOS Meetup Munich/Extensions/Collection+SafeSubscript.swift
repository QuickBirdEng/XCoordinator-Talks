//
//  Collection+SafeSubscript.swift
//  iOS Meetup Munich
//
//  Created by Paul Kraft on 08.07.19.
//  Copyright © 2019 QuickBird Studios. All rights reserved.
//

import Foundation

extension RandomAccessCollection {
    subscript(safe index: Index) -> Element? {
        guard indices.contains(index) else { return nil }
        return self[index]
    }
}
