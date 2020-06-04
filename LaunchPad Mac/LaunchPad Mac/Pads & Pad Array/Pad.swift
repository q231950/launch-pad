//
//  Pad.swift
//  LaunchPad Mac
//
//  Created by Kim Dung-Pham on 04.06.20.
//

import Foundation

class Pad: Hashable {

    let identifier: UInt8
    let uuid = UUID().uuidString
    var selected: Bool = false

    init(identifier: UInt8) {
        self.identifier = identifier
    }

    static func == (lhs: Pad, rhs: Pad) -> Bool {
        lhs.uuid == rhs.uuid
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}

