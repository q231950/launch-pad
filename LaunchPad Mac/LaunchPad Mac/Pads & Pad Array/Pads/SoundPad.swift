//
//  SoundPad.swift
//  LaunchPad Mac
//
//  Created by Kim Dung-Pham on 05.06.20.
//

import Foundation
import AppKit

class SoundPad: Pad {

    let sound: String

    init(identifier: UInt8, sound: String) {
        self.sound = sound
        super.init(identifier: identifier)
    }

    override var selected: Bool {
        didSet {
            if selected {
                DispatchQueue.main.async {
                    NSSound(named: self.sound)?.play()
                }
            }
        }
    }
}
