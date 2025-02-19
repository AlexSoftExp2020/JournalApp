//
//  TitleView.swift
//  JournalApp
//
//  Created by Oleksii on 05.01.2025.
//

import SwiftUI

struct TitleView: View {
    @Binding var entry: Entry
    var isEditing: Bool  = false
    var body: some View {
        ZStack {
            EntryBannerTheme(forTheme: entry.theme)
                .modifier(EntryBannerStyle(theme: entry.theme))
            
            if isEditing {
                TextField("Add title", text: $entry.title)
                    .font(entry.font.uiFont(30))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.darkBrown)
            } else {
                Text(entry.title)
                    .font(entry.font.uiFont(30))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.darkBrown)
            }
        }
    }
}

#Preview {
    TitleView(entry: .constant(Entry()), isEditing: false)
}
