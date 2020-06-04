//
//  ContentView.swift
//  LaunchPad Mac
//
//  Created by Kim Dung-Pham on 31.05.20.
//

import SwiftUI
import CombineMIDI

struct ContentView: View {
    @ObservedObject var padProvider: PadProvider

    var body: some View {
        VStack {
            ForEach(padProvider.rows, id: \.self) { row in
                HStack {
                    ForEach(row.pads, id: \.self) { pad in
                        Rectangle()
                            .fill(self.fill(for: pad))
                            .frame(width: 200, height: 200)
                    }
                }
            }
        }
    }

    func fill(for pad: Pad) -> Color {
        if pad.selected {
            return Color.orange
        }

        return Color.black
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let client = MIDIClient(name: "My app MIDI client")
        let padProvider = PadProvider(midiPublisher: client.publisher())
        return ContentView(padProvider: padProvider)
    }
}
