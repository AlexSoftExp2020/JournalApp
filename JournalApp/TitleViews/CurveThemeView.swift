//
//  CurveThemeView.swift
//  JournalApp
//
//  Created by Oleksii on 29.12.2024.
//

import SwiftUI

struct CurveThemeView: View {
    var body: some View {
        HStack {
            VStack {
                ZStack {
                    Circle()
                        .frame(width: 25)
                        .foregroundColor(.curveOrange)
                    Circle()
                        .frame(width: 15)
                        .foregroundColor(.curveRed)
                        .offset(x: -10, y: -5)
                }
                ZStack {
                    Circle()
                        .frame(width: 30)
                        .foregroundColor(.curveBrown)
                        .offset(x: -5)
                    Circle()
                        .frame(width: 20)
                        .foregroundColor(.curveBlue)
                        .offset(x: 10, y: 5)
                }
            }
            Spacer()
            VStack {
                ZStack {
                    Circle()
                        .frame(width: 40)
                        .foregroundColor(.curveBlue)
                        .offset(x: 5, y: -10)
                    Circle()
                        .frame(width: 30)
                        .foregroundColor(.curveOrange)
                        .offset(x: 6, y: 5)
                    Circle().frame(width: 18).foregroundColor(.curveRed).offset(x: 0, y: 20)
                }
            }
        }
    }
}

#Preview {
    CurveThemeView().modifier(EntryBannerStyle(theme: .curve))
}
