//
//  CommandDispatcher.swift
//  LaunchPad Mac
//
//  Created by Kim Dung-Pham on 02.06.20.
//

import Foundation
import CommandsCore

struct CommandDispatcher {

    func dispatch() {
        let commandExecutor = CommandExecutor()
            commandExecutor.outputHandler = { text in
                print(text)
            }
//            commandExecutor.terminationHandler = { _ in
//            }
            let command = Command(launchPath: "/bin/zsh", arguments: ["-lc", "( cd /Users/kim.dung-pham/Development/source.xing.com/monorepo && bundle exec lotto draw )"])
            commandExecutor.execute(command)
    }
}
