//
//  EmojiMemoryGameView.swift
//  SwiftUI-Practice
//
//  Created by Jack Bodine on 2/4/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {

    @ObservedObject var game: EmojiMemoryGame  // @ObservedObject means that when it changes redraw the view. Has to be a var
    @State var emojiCount: Int = 6

    var body: some View {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                    ForEach(game.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                game.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(.red)
            .padding(.horizontal)
        
    }
}

    
struct CardView: View {
    let card: EmojiMemoryGame.Card   // Only pass into it the minimum it needs. not the whole viewModel.
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Text(card.content)
                        .font(font(in: geometry.size))
                } else if card.isMatched{
                    shape.opacity(0)
                } else {
                    shape.fill()
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        return Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants { // we never create this, and only give it static lets. It collects "magic numbers" and gives them labels.
        static let cornerRadius: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.8
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
    }
}
