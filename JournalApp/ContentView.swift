//
//  ContentView.swift
//  JournalApp
//
//  Created by Oleksii on 27.12.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var journalData = JournalData()
    var body: some View {
        // MARK: TODO EntryList
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
