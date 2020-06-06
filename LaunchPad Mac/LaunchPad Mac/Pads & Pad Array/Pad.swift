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
    var action: Actionable?
    var selected: Bool = false {
        didSet {
            if selected {
                action?.perform()
            }
        }
    }

    init(identifier: UInt8, action: Actionable? = nil) {
        self.identifier = identifier
        self.action = action
    }

    static func == (lhs: Pad, rhs: Pad) -> Bool {
        lhs.uuid == rhs.uuid
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}

