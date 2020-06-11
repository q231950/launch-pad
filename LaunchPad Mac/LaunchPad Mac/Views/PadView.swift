//
//  PadView.swift
//  LaunchPad Mac
//
//  Created by Kim Dung-Pham on 11.06.20.
//

import SwiftUI

struct PadView: View {
    @ObservedObject var pad: Pad

    var body: some View {
        Rectangle()
            .fill(self.fill(for: pad))
            .aspectRatio(1, contentMode: .fit)
    }

    func fill(for pad: Pad) -> Color {
        if pad.selected {
            return Color.orange
        }

        return Color.black
    }
}
