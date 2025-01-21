//
//  PickCardView.swift
//  JournalApp
//
//  Created by Oleksii on 21.01.2025.
//

import SwiftUI

struct PickCardView: View {
    @Binding var entry: Entry
    @Binding var showingSheet: Bool
    
    var body: some View {
        VStack {
            Grid(horizontalSpacing: 15, verticalSpacing: 15) {
                GridRow {
                    Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                    Text("Half")
                        .modifier(FontStyle(size: 18))
                    Text("Full")
                        .modifier(FontStyle(size: 18))
                }
                
                ForEach(Card.allCases, id: \.id) { option in
                    GridRow {
                        Text(Card.title(option))
                            .modifier(FontStyle(size: 18))
                            .gridCellAnchor(.trailing)
                        Button {
                            entry.addCard(card: CardData(card: option, size: .small))
                            showingSheet = false
                        } label: {
                            // MARK: TODO CardOptionView
                        }

                    }
                }
            }
        }
        .padding(.top)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.paleOrange)
        .overlay(alignment: .topTrailing) {
            Button {
                showingSheet.toggle()
            } label: {
                Image(systemName: "xmark")
                    .modifier(FontStyle(size: 16))
            }
            .padding()
        }
    }
}

#Preview {
    PickCardView(entry: .constant(Entry()), showingSheet: .constant(true))
}

struct CardOptionView: View {
    var icon: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.darkBrown)
            Image(systemName: icon)
                .foregroundColor(.paleOrange)
                .font(.system(size: 25))
        }
    }
}
