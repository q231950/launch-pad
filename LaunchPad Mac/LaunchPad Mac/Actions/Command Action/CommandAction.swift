//
//  DoNotDisturbPad.swift
//  LaunchPad Mac
//
//  Created by Kim Dung-Pham on 04.06.20.
//

import Foundation
import CommandsCore

extension Action {

    struct Command: Actionable {
        let command: String

        init(command: String) {
            self.command = command
        }

        func perform() {
            DispatchQueue.main.async {
                let command = CommandsCore.Command(launchPath: "/bin/zsh", arguments: ["-lc", self.command])

                let commandDispatcher = CommandDispatcher()

                commandDispatcher.dispatch(command: command)
            }
        }
    }
}
