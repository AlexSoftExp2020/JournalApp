//
//  ThemeViews.swift
//  JournalApp
//
//  Created by Oleksii on 29.12.2024.
//

import SwiftUI

struct EntryBannerTheme: View {
    var forTheme: JournalTheme
    var body: some View {
        switch forTheme {
        case .line:
            YourTitleBannerView()
        case .curve:
            CurveThemeView()
        case .dot:
            DotThemeView()
        case .ray:
            RayThemeView()
        case .wave:
            WaveThemeView()
        }
    }
}

struct BackgroundIcon: View {
    var forTheme: JournalTheme
    var body: some View {
        switch forTheme {
        case .line:
            Image("LineIcon")
                .resizable()
        case .curve:
            Image("CurveIcon")
                .resizable()
        case .dot:
            Image("DotIcon")
                .resizable()
        case .ray:
            Image("RayIcon")
                .resizable()
        case .wave:
            Image("WaveIcon")
                .resizable()
        }
    }
}

struct CardBackground: View {
    var theme: JournalTheme = .line
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .foregroundColor(getCardBackground(forTheme: theme))
            .shadow(color: Color.shadow, radius: 4)
    }
    
    func getCardBackground(forTheme: JournalTheme) -> Color {
        switch forTheme {
        case .line: return Color.paleOrange
        case .curve: return Color.curveCard
        case .dot: return Color.dotCard
        case .ray: return Color.rayCard
        case .wave: return Color.waveCard
        }
    }
}

struct EntryBannerStyle: ViewModifier {
    var theme: JournalTheme
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .background(CardBackground(theme: theme))
    }
}
