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
        let contentView = ContentView(midiPublisher: client.publisher())

        // Create the window and set the content view. 
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)

//        channelCancellable = client
//            .publisher()
//            .filter { $0.status == .noteOn || $0.status == .noteOff }
////            .map { $0.data1 }
//            .receive(on: RunLoop.main)
//            .sink { value in
//                print("Input Device is \(value)")
//        }
//
//        cancellable = client
//            .publisher()
//            .filter { $0.status == .controlChange }
////            .map { $0.data2 }
//            .receive(on: RunLoop.main)
//            .sink { value in
//                print("Device: \(value.data1) Value: \(value.data2)")
//        }

        

    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

