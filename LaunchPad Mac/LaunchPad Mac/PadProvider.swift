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

    var rows = [PadArray(pads: [
        Pad(identifier: 40, action: Action.Command(command: "( cd ~ && ls )")),
        Pad(identifier: 41),
        Pad(identifier: 42),
        Pad(identifier: 43, action: Action.DoNotDisturb())]),
                PadArray(pads: [
                    Pad(identifier: 36, action: Action.Sound("Hero")),
                    Pad(identifier: 37, action: Action.Sound("Basso")),
                    Pad(identifier: 38, action: Action.Sound("Submarine")),
                    Pad(identifier: 39, action: Action.Sound("Blow"))])]

    init(midiPublisher: MIDIPublisher) {

        self.midiPublisher = midiPublisher

        self.cancellableMIDISink = midiPublisher.receive(on: RunLoop.main).sink { [weak self] message in
            self?.setPad(identifiedBy: message.data1, selected: message.status == .noteOn)
        }
    }

    private func setPad(identifiedBy identifier: UInt8?, selected: Bool) {
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
