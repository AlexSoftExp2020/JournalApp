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
            SleepView(value: Binding<Double>(get: { value }, set: { cardData.card = .mood(value: $0) } ),
                      isEditing: isEditing,
                      fontStyle: fontStyle,
                      size: cardData.size)
        case .sketch(value: let value):
            SketchView(value: Binding<[Line]>(get: { value }, set: { cardData.card = .sketch(value: $0) } ),
                       isEditing: isEditing,
                       fontStyle: fontStyle,
                       size: cardData.size)
        case .photo(value: let value):
            PhotoView(value: Binding<ImageModel>(get: { value }, set: { cardData.card = .photo(value: $0) } ),
                      isEditing: isEditing,
                      fontStyle: fontStyle)
        case .text(value: let value):
            // MARK: TODO TextView(...
        }
    }
}

#Preview {
    CardView(cardData: .constant(CardData(card: .mood(value: "😢"))), isEditing: true, fontStyle: .font1)
        .background(CardBackground())
}
