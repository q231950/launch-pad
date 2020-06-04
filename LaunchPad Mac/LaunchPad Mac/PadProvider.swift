//
//  PadProvider.swift
//  LaunchPad Mac
//
//  Created by Kim Dung-Pham on 04.06.20.
//

import Foundation
import CombineMIDI
import Combine

class PadProvider: ObservableObject {
    let midiPublisher: MIDIPublisher
    var cancellableMIDISink: AnyCancellable?

    var rows = [PadArray(pads: [Pad(identifier: 40), Pad(identifier: 41), Pad(identifier: 42), DoNotDisturbPad(identifier: 43)]),
                PadArray(pads: [Pad(identifier: 36), Pad(identifier: 37), Pad(identifier: 38), Pad(identifier: 39)])]

    init(midiPublisher: MIDIPublisher) {

        self.midiPublisher = midiPublisher

        self.cancellableMIDISink = midiPublisher.receive(on: RunLoop.main).sink { [weak self] message in
            self?.setPad(identifiedBy: message.data1, selected: message.status == .noteOn)
        }
    }

    private func setPad(identifiedBy identifier: UInt8, selected: Bool) {
        self.rows.reduce([Pad](), { (result, row) -> [Pad] in
            var x = result
            x.append(contentsOf: row.pads)
            return x
        }).filter({ $0.identifier == identifier }).forEach({
            $0.selected = selected
            objectWillChange.send()
        })
    }

    deinit {
        self.cancellableMIDISink?.cancel()
    }
}
