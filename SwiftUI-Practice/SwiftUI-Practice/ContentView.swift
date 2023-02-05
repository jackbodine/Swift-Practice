//
//  ContentView.swift
//  SwiftUI-Practice
//
//  Created by Jack Bodine on 2/4/23.
//

import SwiftUI

struct ContentView: View {
    
    var emojis = ["🚀", "✈️", "🚜", "🚁", "🚙", "🚕", "🚗", "🛸"]
    // : [String] is identical to Array<String>
    @State var emojiCount: Int = 6
    
    var body: some View {
        VStack {
            HStack {
                ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                    CardView(content: emoji)
                }
            }
            .padding(.horizontal)
            Spacer()
            HStack{
                remove
                Spacer()
                add
            }.padding(.horizontal)
                .font(.largeTitle)
        }.foregroundColor(.red)
        
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View {
        Button{
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true //View is still immutable but it turns the variable into a pointer to a boolean somewhere else in memory.
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 24)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 4)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
