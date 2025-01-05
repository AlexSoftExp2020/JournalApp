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

struct EditingButton: View {
    @Binding var entries: [Entry]
    @Binding var entry: Entry
    @Binding var entryCopy: Entry
    @Binding var isNew: Bool
    @Binding var isEditing: Bool
    var action: () -> Void = { }
    var isAdded: Bool {
        entries.filter({ $0.id == entryCopy.id }).first != nil
    }
    
    var body: some View {
        Button {
            if isNew && isEditing {
                if !isAdded {
                    entries.append(entryCopy)
                } else {
                    if let index = entries.firstIndex(where: {$0.id == entryCopy.id }) {
                        entries[index].update(from: entryCopy)
                    }
                }
            } else if !isNew && isEditing {
                entry.update(from: entryCopy)
            } else if !isNew && !isEditing {
                entryCopy = entry
            }
            withAnimation(.spring()) {
                isEditing.toggle()
            }
        } label: {
            if isNew && isEditing {
                if isAdded {
                    Text("Done")
                        .fontWeight(.medium)
                } else {
                    Text("Add")
                        .fontWeight(.medium)
                }
            } else if !isNew && isEditing {
                Text("Done")
                    .fontWeight(.medium)
            } else if !isEditing {
                Text("Edit")
                    .fontWeight(.medium)
            }
        }
    }
}

struct EntryDetail: View {
    @Binding var entries: [Entry]
    @Binding var entry: Entry
    
    @State private var isNew: Bool
    @State private var isEditing: Bool
    @State private var entryCopy = Entry()
    
    init(entries: Binding<[Entry]>, entry: Binding<Entry>, isNew: Bool) {
        self._entries = entries
        self._entry = entry
        self._isNew = State(initialValue: isNew)
        self.isEditing = State(initialValue: isNew ? true : false)
    }
    
    var body: some View {
       //MARK: TODO - EntryView
    }
}
