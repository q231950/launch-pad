//
//  ContentView.swift
//  LaunchPad Mac
//
//  Created by Kim Dung-Pham on 31.05.20.
//

import SwiftUI
import CombineMIDI

struct ContentView: View {
    let commandDispatcher = CommandDispatcher()
    let doNotDisturbSwitcher = DoNotDisturbSwitcher()
    let midiPublisher: MIDIPublisher
    @State var selectedPad: UInt8? = 99

    var body: some View {
        VStack {
            HStack {
                Rectangle()
                    .fill(fill(for: 40))
                    .frame(width: 200, height: 200)

                Rectangle()
                    .fill(fill(for: 41))
                    .frame(width: 200, height: 200)

                Rectangle()
                    .fill(fill(for: 42))
                    .frame(width: 200, height: 200)

                Rectangle()
                    .fill(fill(for: 43))
                    .frame(width: 200, height: 200)
            }
            HStack {
                Rectangle()
                    .fill(fill(for: 36))
                    .frame(width: 200, height: 200)

                Rectangle()
                    .fill(fill(for: 37))
                    .frame(width: 200, height: 200)

                Rectangle()
                    .fill(fill(for: 38))
                    .frame(width: 200, height: 200)

                Rectangle()
                    .fill(fill(for: 39))
                    .frame(width: 200, height: 200)
            }
        }
        .onReceive(midiPublisher.receive(on: RunLoop.main), perform: { message in
            if message.status == .noteOn {
                self.selectedPad = message.data1


                // dnd
                if self.selectedPad == 43 {
                    self.doNotDisturbSwitcher.enableDND()
                } else if self.selectedPad == 39 {
                    self.doNotDisturbSwitcher.disableDND()
                }




            } else {
                self.selectedPad = 99
            }
        })
    }

    func fill(for pad: UInt8) -> Color {
        if let selectedPad = selectedPad {
            if selectedPad == pad {
                return Color.orange
            }
        }

        return Color.black
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let client = MIDIClient(name: "My app MIDI client")
        return ContentView(midiPublisher: client.publisher())
    }
}
