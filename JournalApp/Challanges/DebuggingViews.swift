//
//  DebuggingViews.swift
//  JournalApp
//
//  Created by Oleksii on 03.01.2025.
//

import SwiftUI

struct HalfCard: View {
    var body: some View {
        VStack {
            Image(systemName: "crown.fill")
                .font(.system(size: 80))
        }
        //#-learning-code-snippet(6.debugFrameCorrection)
        .overlay(alignment: .topLeading) {
            VStack {
                Image(systemName: "crown.fill")
                    .font(.body)
                Text("Q")
                    .font(.largeTitle)
                Image(systemName: "heart.fill").font(.title)
            }
            .padding()
        }
        //#-learning-code-snippet(6.debugFrameQuestion)
        //#-learning-code-snippet(6.debugFrame)
        //#-learning-code-snippet(6.debugBorder)
    }
}

struct DebuggingViews: View {
    var body: some View {
        VStack {
            HalfCard()
            HalfCard()
                .rotationEffect(.degrees(180))
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black)
        )
        .aspectRatio(0.70, contentMode: .fit)
        .foregroundColor(.red)
        .padding()
    }
}

#Preview {
    DebuggingViews()
}
