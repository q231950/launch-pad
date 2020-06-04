//
//  CommandPad.swift
//  LaunchPad Mac
//
//  Created by Kim Dung-Pham on 04.06.20.
//

import Foundation
import CommandsCore

class CommandPad: Pad {
    let commandDispatcher = CommandDispatcher()

    override var selected: Bool {
        didSet {
            if selected {
                DispatchQueue.main.async {
                    let command = Command(launchPath: "/bin/zsh", arguments: ["-lc", "( cd ~ && ls )"])
                    self.commandDispatcher.dispatch(command: command)
                }
            }
        }
    }
}

