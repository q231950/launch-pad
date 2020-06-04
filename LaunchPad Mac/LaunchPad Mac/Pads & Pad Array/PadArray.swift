//
//  PadArray.swift
//  LaunchPad Mac
//
//  Created by Kim Dung-Pham on 04.06.20.
//

import Foundation

class PadArray: Hashable {
    var pads: [Pad]
    let uuid = UUID().uuidString

    init(pads: [Pad]) {
        self.pads = pads
    }

    static func == (lhs: PadArray, rhs: PadArray) -> Bool {
        lhs.uuid == rhs.uuid
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}
