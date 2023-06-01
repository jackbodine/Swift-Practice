//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Jack Bodine on 6/1/23.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    var body: some Scene {
        let document = MyEmojiArtDocument()
        DocumentGroup(newDocument: EmojiArtDocument()) { file in
            EmojiArtDocumentView(document: document)
        }
    }
}
