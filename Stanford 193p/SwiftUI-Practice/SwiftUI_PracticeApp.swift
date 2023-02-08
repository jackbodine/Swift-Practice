//
//  SwiftUI_PracticeApp.swift
//  SwiftUI-Practice
//
//  Created by Jack Bodine on 2/4/23.
//

import SwiftUI

@main
struct SwiftUI_PracticeApp: App {
    let game = EmojiMemoryGame()    // Viewmodels should be let (constants)
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
