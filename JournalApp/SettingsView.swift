//
//  SettingsView.swift
//  JournalApp
//
//  Created by Oleksii on 04.01.2025.
//

import SwiftUI

struct SettingsView: View {
    @Binding var entry: Entry
    @Binding var showingSheet: Bool
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Font").modifier(FontStyle(size: 20)).padding(.top)
                ForEach(JournalFont.allCases, id: \.self) { font in
                    // MARK: TODO
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
