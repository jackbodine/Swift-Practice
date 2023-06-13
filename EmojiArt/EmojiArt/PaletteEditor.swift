//
//  PaletteEditor.swift
//  EmojiArt
//
//  Created by Jack Bodine on 6/13/23.
//

import SwiftUI

struct PaletteEditor: View {
    @Binding var palette: Palette
    
    var body: some View {
        Form {
            nameSection
            addEmojisSection
        }.frame(minWidth: 300, minHeight: 350)
            .navigationTitle("Edit \(palette.name)")
    }
    
    var nameSection: some View {
        Section(header: Text("Name")) {
            TextField("Name", text: $palette.name)
        }
    }
    
    @State private var emojisToAdd = ""
    
    var addEmojisSection: some View {
        Section(header: Text("Add Emojis")) {
            TextField("", text: $emojisToAdd)
                .onChange(of: emojisToAdd) { emojis in
                    addEmojis(emojis)
                }
        }
    }
    
    func addEmojis(_ emojis: String) {
        withAnimation() {
            palette.emojis = (emojis + palette.emojis)
                .filter { $0.isEmoji }
        }
    }
}

struct PaletteEditor_Previews: PreviewProvider {
    static var previews: some View {
//        Text("Fix Me!")
        PaletteEditor(palette: .constant(PaletteStore(named: "Preview").palette(at: 1)))
    }
}
