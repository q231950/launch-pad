//
//  DoNotDisturbAction.swift
//  LaunchPad Mac
//
//  Created by Kim Dung-Pham on 06.06.20.
//

import Foundation

extension Action {
    struct DoNotDisturb: Actionable {
        // DND
        // macOS https://stackoverflow.com/a/45645595
        // slackOS https://api.slack.com/docs/presence-and-status
        let doNotDisturbSwitcher = DoNotDisturbSwitcher()

        func perform() {
            doNotDisturbSwitcher.toggle()
        }
    }
}
