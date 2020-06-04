//
//  DoNotDisturbPad.swift
//  LaunchPad Mac
//
//  Created by Kim Dung-Pham on 04.06.20.
//

import Foundation

// DND
// macOS https://stackoverflow.com/a/45645595
// slackOS https://api.slack.com/docs/presence-and-status
class DoNotDisturbPad: Pad {
    let doNotDisturbSwitcher = DoNotDisturbSwitcher()

    override var selected: Bool {
        didSet {
            if selected {
                doNotDisturbSwitcher.toggle()
            }
        }
    }
}

