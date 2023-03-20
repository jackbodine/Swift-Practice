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
    typealias Card = MemoryGame<String>.Card
    
    @State static var isLoggedIn:Bool = false
    
    private static let emojis = ["🚀", "✈️", "🚜", "🚁", "🚙", "🚕", "🚗", "🛸"]    // Sudo global. By EmojiMemoryGame.emojis
    //This one creates it's own model.
    // private(set) makes it readable but not writable.
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: 5) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    // PRIVATE!!!! So that views cannot reach into the model itself.
    
    var cards: Array<Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card) {
//        objectWillChange.send() //publish to the world that something changed. Automatically done by @published
        model.choose(card)
    }
}

