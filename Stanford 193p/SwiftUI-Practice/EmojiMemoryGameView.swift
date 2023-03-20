//
//  EmojiMemoryGameView.swift
//  SwiftUI-Practice
//
//  Created by Jack Bodine on 2/4/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {

    @ObservedObject var game: EmojiMemoryGame  // @ObservedObject means that when it changes redraw the view. Has to be a var

    var body: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3, content: { card in
            cardView(for: card)
        })


            .foregroundColor(.red)
            .padding(.horizontal)
        
    }
    
    @ViewBuilder
    private func cardView(for card: EmojiMemoryGame.Card) -> some View {
        if card.isMatched && !card.isFaceUp {
            Rectangle().opacity(0)
        } else {
            CardView(card: card)
                .padding(4)
                .onTapGesture {
                    game.choose(card)
                }
        }
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
                    Pie(startAngle: Angle(degrees: 270), endAngle: Angle(degrees: 20)).padding(5)
                        .opacity(0.5)
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
        static let cornerRadius: CGFloat = 8
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.7
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
    }
}
