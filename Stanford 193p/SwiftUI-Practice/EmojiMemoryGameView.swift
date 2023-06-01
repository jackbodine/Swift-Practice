//
//  EmojiMemoryGameView.swift
//  SwiftUI-Practice
//
//  Created by Jack Bodine on 2/4/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {

    @ObservedObject var game: EmojiMemoryGame  // @ObservedObject means that when it changes redraw the view. Has to be a var
    @Namespace private var dealingNamespace

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                gameBody
                
                HStack {
                    restart
                    Spacer()
                    shuffle
                }.padding(.horizontal)
            }
            
            deckBody
        }
        .padding()
        
    }
    
    @State private var delt = Set<Int>()
    
    private func deal(_ card: EmojiMemoryGame.Card){
        delt.insert(card.id)
    }
    
    private func isUndelt(_ card: EmojiMemoryGame.Card) -> Bool {
        return !delt.contains(card.id)
    }
    
    private func dealAnimation(for card: EmojiMemoryGame.Card) -> Animation {
        var delay = 0.0
        
        if let index = game.cards.firstIndex(where: { $0.id == card.id }) {
            delay = Double(index) * (CardConstants.totalDealDuration / Double(game.cards.count))
        }
        
        return Animation.easeInOut(duration: CardConstants.dealDuration).delay(delay)
    }
    
    private func zIndex(of card: EmojiMemoryGame.Card) -> Double {
        -Double(game.cards.firstIndex(where: {$0.id == card.id }) ?? 0)
    }
     
    var gameBody: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3, content: { card in
            cardView(for: card)
        })
        .foregroundColor(CardConstants.color)
    }
    
    var deckBody: some View {
        ZStack{
            ForEach(game.cards.filter {isUndelt($0)} ) { card in
                 CardView(card: card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .transition(AnyTransition.asymmetric(insertion: .opacity, removal: .identity))
                    .zIndex(zIndex(of: card))
            }
        }
        .frame(width: CardConstants.undeltWidth, height: CardConstants.undeltHeight)
        .foregroundColor(CardConstants.color)
        .onTapGesture {
            // "deal" cards
            for card in game.cards {
                withAnimation(dealAnimation(for: card)) {
                    deal(card)
                }
            }
        }
    }
    
    var shuffle: some View {
        Button("Shuffle") {
            withAnimation(.easeInOut) {
                game.shuffle()
            }
        }
    }
    
    var restart: some View {
         Button("Restart") {
             withAnimation() {
                 delt = []
                 game.restart()
             }
        }
    }
    
    private struct CardConstants {
        static let color = Color.red
        static let aspectRatio: CGFloat = 2/3
        static let dealDuration: Double = 0.5
        static let totalDealDuration: Double = 2
        static let undeltHeight: CGFloat = 90
        static let undeltWidth = undeltHeight * aspectRatio
    }
    
    @ViewBuilder
    private func cardView(for card: EmojiMemoryGame.Card) -> some View {
        if isUndelt(card) || card.isMatched && !card.isFaceUp {
            Color.clear //Rectangle().opacity(0)
        } else {
            CardView(card: card)
                .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                .padding(4)
                .transition(AnyTransition.asymmetric(insertion: .identity, removal: .opacity))
                .zIndex(zIndex(of: card))
                .onTapGesture {
                    withAnimation(.easeIn) {
                        game.choose(card)
                    }
                }
        }
    }
}

    
struct CardView: View {
    let card: EmojiMemoryGame.Card   // Only pass into it the minimum it needs. not the whole viewModel.
    
    @State private var animatedBonusRemaining: Double = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Group {
                    if card.isConsumingBonusTime {
                        Pie(startAngle: Angle(degrees: 270), endAngle: Angle(degrees: (1-animatedBonusRemaining)*360-90))
                            .onAppear() {
                                animatedBonusRemaining = card.bonusRemaining
                                withAnimation(.linear(duration: card.bonusTimeRemaining)) {
                                    animatedBonusRemaining = 0
                                }
                            }
                    } else {
                        Pie(startAngle: Angle(degrees: 270), endAngle: Angle(degrees: (1-card.bonusTimeRemaining)*360-90))
                    }
                }
                    .padding(5)
                    .opacity(0.5)
                Text(card.content)
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(Animation.easeInOut(duration: 1))
                    .font(Font.system(size:DrawingConstants.fontSize))
                    .scaleEffect(scale(thatFits: geometry.size))
            }.cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    private func scale(thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) / (DrawingConstants.fontSize / DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants { // we never create this, and only give it static lets. It collects "magic numbers" and gives them labels.
        static let fontScale: CGFloat = 0.7
        static let fontSize: CGFloat = 32
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
