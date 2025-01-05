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
                // MARK: TODO
            }
        }
    }
}

#Preview {
    EntryView()
}
