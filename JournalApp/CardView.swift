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
            // MARK: TODO
        }
    }
}

#Preview {
    CardView()
}
