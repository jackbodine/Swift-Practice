//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Jack Bodine on 6/1/23.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    let document = MyEmojiArtDocument()
    let paletteStore = PaletteStore(named: "Default")
    
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document:  document)
        }
    }
}
