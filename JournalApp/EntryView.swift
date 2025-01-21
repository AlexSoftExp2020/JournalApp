//
//  EntryView.swift
//  JournalApp
//
//  Created by Oleksii on 05.01.2025.
//

import SwiftUI

struct EntryView: View {
    @Binding var entry: Entry
    @Binding var entryCopy: Entry
    @Binding var isEditing: Bool
    
    @State private var showingCardOptions = false
    @State private var showingSettings = false
    
    private func isSmallView(for entryRow: EntryRow) -> Bool {
        return entryRow.cards[0].size == .small
    }
    
    private var currentEntry: Entry {
        isEditing ? entryCopy : entry
    }
    
    private var currentEntryBinding: Binding<Entry> {
        isEditing ? $entryCopy : $entry
    }
    
    var body: some View {
        ScrollView {
            Grid(alignment: .top) {
                TitleView(entry: currentEntryBinding, isEditing: isEditing)
                    .padding(5)
                ForEach(0..<currentEntry.entryRows.count, id: \.self) { row in
                    if isSmallView(for: currentEntry.entryRows[row]) {
                        GridRow {
                            ForEach(0..<currentEntry.entryRows[row].count, id: \.self) { index in
                                // MARK: TODO
                            }
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private func getCardView(row: Int, index: Int) -> some View {
        CardView(cardData: currentEntryBinding.entryRows[row].cards[index],
                 isEditing: isEditing,
                 fontStyle: currentEntry.font)
        .overlay(alignment: .topTrailing) {
            RemoveCardButton(entryCopy: $entryCopy, card: currentEntry.entryRows[row].cards[index].card,
                             isEditing: isEditing,
                             row: row,
                             index: index)
        }
        .modifier(CardStyle(theme: currentEntry.theme))
    }
}

#Preview {
    EntryView()
}
