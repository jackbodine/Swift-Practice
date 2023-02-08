//
//  EmojiMemoryGame.swift
//  SwiftUI-Practice
//
//  Created by Jack Bodine on 2/6/23.
//

import Foundation
import SwiftUI

// This is the viewmodel
class EmojiMemoryGame: ObservableObject {
    
    @State static var isLoggedIn:Bool = false
    
    static let emojis = ["🚀", "✈️", "🚜", "🚁", "🚙", "🚕", "🚗", "🛸"]    // Sudo global. By EmojiMemoryGame.emojis
    //This one creates it's own model.
    // private(set) makes it readable but not writable.
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    // PRIVATE!!!! So that views cannot reach into the model itself.
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
//        objectWillChange.send() //publish to the world that something changed. Automatically done by @published
        model.choose(card)
    }
}

