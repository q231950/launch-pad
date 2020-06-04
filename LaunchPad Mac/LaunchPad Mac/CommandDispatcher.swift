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

        commandExecutor.terminationHandler = { code in
            let notification = NSUserNotification()

            notification.title = "exit(\(code))"
            notification.subtitle = "cd ~ && ls"

            NSUserNotificationCenter.default.deliver(notification)
        }
        let command = Command(launchPath: "/bin/zsh", arguments: ["-lc", "( cd ~ && ls )"])
        commandExecutor.execute(command)
    }
}
