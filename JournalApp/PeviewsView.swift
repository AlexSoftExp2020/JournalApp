//
//  PeviewsView.swift
//  JournalApp
//
//  Created by Oleksii on 27.12.2024.
//

import Foundation
import SwiftUI

struct TitleBannerPreview: View {
    var body: some View {
        VStack {
            YourTitleBannerSolutionView()
                .modifier(EntryBannerStyle(theme: .line))
            YourTitleBannerView()
                .modifier(EntryBannerStyle(theme: .line))
        }
        .padding()
    }
}

struct YourTitleBannerSolutionView: View {
    var body: some View {
        HStack {
            VStack {
                ZStack {
                    Circle()
                        .frame(width: 25)
                        .foregroundColor(.bannerBlue)
                    
                    Circle()
                        .frame(width: 15)
                        .foregroundColor(.bannerYellow).offset(x: -10, y: -5)
                }
                ZStack {
                    Circle()
                        .frame(width: 30)
                        .foregroundColor(.bannerPink)
                        .offset(x: -5)
                    Circle()
                        .frame(width: 20)
                        .foregroundColor(.bannerOrange).offset(x: 10, y: 5)
                }
            }
            Spacer()
            ZStack {
                Circle()
                    .frame(width: 40)
                    .foregroundColor(.bannerBlue)
                    .offset(x: 5, y: -10)
                Circle()
                    .frame(width: 30)
                    .foregroundColor(.bannerPink)
                    .offset(x: 6, y: 5)
                Circle()
                    .frame(width: 18)
                    .foregroundColor(.bannerOrange)
                    .offset(y: 20)
            }
        }
    }
}
