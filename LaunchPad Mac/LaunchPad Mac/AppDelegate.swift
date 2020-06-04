//
//  AppDelegate.swift
//  LaunchPad Mac
//
//  Created by Kim Dung-Pham on 31.05.20.
//

import Cocoa
import SwiftUI
import Combine
import CombineMIDI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!
    var channelCancellable: Cancellable?
    var cancellable: Cancellable?


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        let client = MIDIClient(name: "My app MIDI client")
        let padProvider = PadProvider(midiPublisher: client.publisher())
        let contentView = ContentView(padProvider: padProvider)

        // Create the window and set the content view. 
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

