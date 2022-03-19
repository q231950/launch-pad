//
//  DoNotDisturbPad.swift
//  LaunchPad Mac
//
//  Created by Kim Dung-Pham on 04.06.20.
//

import Foundation
import Commands

extension Action {

    struct Command: Actionable {
        let commandText: String

        init(command: String) {
            self.commandText = command
        }

        func perform() {
            DispatchQueue.main.async {
                let command = Commands.Command(launchPath: "/bin/zsh", arguments: ["-lc", self.commandText])

                let commandDispatcher = CommandDispatcher()

                commandDispatcher.dispatch(command: command, text: self.commandText)
            }
        }
    }
}
