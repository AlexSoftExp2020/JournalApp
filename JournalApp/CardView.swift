//
//  CardView.swift
//  JournalApp
//
//  Created by Oleksii on 05.01.2025.
//

import SwiftUI

struct CardView: View {
    
    @Binding var cardData: CardData
    var isEditing: Bool
    var fontStyle: JournalFont
    
    var body: some View {
        switch cardData.card {
        case .mood(let value):
            MoodView(value: Binding<String>(get: { value }, set: { cardData.card = .mood(value: $0) } ),
                     isEditing: isEditing,
                     fontStyle: fontStyle,
                     size: cardData.size)
        case .sleep(value: let value):
            SleepView(value: Binding<Double>(get: { value }, set: { cardData.card = .mood(value: $0) } ), isEditing: isEditing, fontStyle: fontStyle, size: cardData.size)
        case .sketch(value: let value):
            // MARK: TODO SketchView(...
        case .photo(value: let value):
            // MARK: TODO PhotoView(...
        case .text(value: let value):
            // MARK: TODO TextView(...
        }
    }
}

#Preview {
    CardView(cardData: .constant(CardData(card: .mood(value: "😢"))), isEditing: true, fontStyle: .font1)
        .background(CardBackground())
}
