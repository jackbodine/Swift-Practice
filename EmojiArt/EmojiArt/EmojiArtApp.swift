//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Jack Bodine on 6/1/23.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    @StateObject var document = MyEmojiArtDocument()
    @StateObject var paletteStore = PaletteStore(named: "Default")
    
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document:  document)
                .environmentObject(paletteStore)
        }
    }
}
