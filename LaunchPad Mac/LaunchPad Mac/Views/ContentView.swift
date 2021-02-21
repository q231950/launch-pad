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
                        PadView(pad: pad)
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let client = MIDIClient(name: "My app MIDI client")
        let padProvider = PadProvider(midiPublisher: client.publisher())
        return ContentView(padProvider: padProvider)
    }
}
