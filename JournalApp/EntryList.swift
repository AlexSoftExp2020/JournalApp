//
//  EntryList.swift
//  JournalApp
//
//  Created by Oleksii on 21.01.2025.
//

import SwiftUI

struct EntryList: View {
    @ObservedObject var journalData: JournalData
    @State private var newEntry = Entry()
    @State private var selection: Entry?
    
    var body: some View {
        NavigationSplitView {
            // MARK: TODO
        } detail: {
            ZStack {
                if let entry = selection, let entryBinding = journalData.getBindingToEntry(entry) {
                    EntryDetail(entries: $journalData.entries, entry: entryBinding, isNew: entry == newEntry)
                } else {
                    // MARK: TODO SelectEntryView()
                }
            }
        }
    }
}

#Preview {
    EntryList(journalData: JournalData())
}

struct JournalAppTitle: View {
    var body: some View {
        Text("Journal")
            .modifier(FontStyle(size: 50))
            .padding()
            .padding(.top)
    }
}

struct SelectEntryView: View {
    var body: some View {
        Text("Select An Entry")
            .modifier(FontStyle(size: 20))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.tanBackground)
            .ignoresSafeArea()
    }
}
