//
//  SoundPad.swift
//  LaunchPad Mac
//
//  Created by Kim Dung-Pham on 05.06.20.
//

import Foundation
import AppKit

extension Action {
    struct Sound: Actionable {
        let sound: String

        init(_ sound: String) {
            self.sound = sound
        }

        func perform() {
            NSSound(named: self.sound)?.play()
        }
    }
}
