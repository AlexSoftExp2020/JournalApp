//
//  ButtonViews.swift
//  JournalApp
//
//  Created by Oleksii on 04.01.2025.
//

import SwiftUI

struct RemoveCardButton: View {
    @Binding var entryCopy: Entry
    var card: Card
    var isEditing: Bool
    var row: Int
    var index: Int
    var action: () -> Void = { }
    
    var body: some View {
        Button {
            entryCopy
                .removeCard(cards: entryCopy.entryRows[row].cards, row: row, index: index)
        } label: {
            Image(systemName: "xmark")
                .foregroundColor(card.isPhoto ? .white : .darkBrown)
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .padding([.top, .trailing])
        }
        .opacity(isEditing ? 1 : 0)
    }
}

struct FontButton: View {
    @Binding var entry: Entry
    var font: JournalFont
    var action: () -> Void = { }
    
    var body: some View {
        Button {
            entry.font = font
        } label: {
            HStack {
                Image(systemName: entry.font == font ? "circle.fill" : "circle")
                    .font(.caption)
                Text(font.rawValue)
                    .font(font.uiFont(18))
                    .padding(.leading, 5)
                    .foregroundColor(.darkBrown)
            }
        }

    }
}
