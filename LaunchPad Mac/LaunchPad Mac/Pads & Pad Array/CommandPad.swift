//
//  CommandPad.swift
//  LaunchPad Mac
//
//  Created by Kim Dung-Pham on 04.06.20.
//

import Foundation

class CommandPad: Pad {
    let commandDispatcher = CommandDispatcher()

    override var selected: Bool {
        didSet {
            if selected {
                commandDispatcher.dispatch()
            }
        }
    }
}

