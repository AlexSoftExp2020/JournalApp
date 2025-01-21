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
                    FontButton(entry: $entry, font: font)
                }
                Text("Theme").modifier(FontStyle(size: 20))
                    .padding(.top)
                Grid(horizontalSpacing: 5, verticalSpacing: 10) {
                    GridRow {
                        //MARK: TODO getBackgroundButton(theme: .line)
                        
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func getBackgroundButton(theme: JournalTheme) -> some View {
        Button {
            entry.theme = theme
        } label: {
            VStack(spacing: 5) {
                BackgroundIcon(forTheme: theme)
                    .scaledToFill()
                    .cornerRadius(10.0)
                    .shadow(color: Color.shadow, radius: 4)
                    .padding(5)
                
                Image(systemName: entry.theme == theme ? "circle.fill" : "circle")
                    .font(.callout)
            }
        }

    }
}

#Preview {
    SettingsView(entry: .constant(Entry()), showingSheet: .constant(true))
}
