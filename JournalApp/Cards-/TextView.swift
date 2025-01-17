//
//  TextView.swift
//  JournalApp
//
//  Created by Oleksii on 12.01.2025.
//

import SwiftUI

struct TextView: View {
    @Binding var value: TextData
    var isEditing: Bool
    var fontStyle: JournalFont = .font1
    
    var placeHolderText = "Write Something"
    var containsPlaceHolderText: Bool {
        value.text == placeHolderText
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if isEditing {
                TextEditor(text: $value.text)
                    .font(fontStyle.uiFont(value.fontSize.rawValue))
                    .foregroundColor(
                        Color("dark-brown")
                            .opacity(containsPlaceHolderText ? 0.7 : 1)
                    )
                    .onTapGesture {
                        if containsPlaceHolderText {
                            value.text = ""
                        }
                    }
                    .padding(.top).scrollContentBackground(<#T##visibility: Visibility##Visibility#>)
            }
        }
    }
}

#Preview {
    TextView()
}
