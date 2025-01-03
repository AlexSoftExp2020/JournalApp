//
//  LayingOutContainersView.swift
//  JournalApp
//
//  Created by Oleksii on 03.01.2025.
//

import SwiftUI

struct LayingOutContainersView: View {
    var body: some View {
        VStack {
            ZStack {
                Rectangle().foregroundColor(.themeBlue)
                Circle().foregroundColor(.themePink)
            }
            ZStack {
                Rectangle().foregroundColor(.themeBlue)
                HStack {
                    Circle().foregroundColor(.themeRed)
                    Circle().foregroundColor(.themeOrange)
                }
            }
        }
    }
}

#Preview {
    LayingOutContainersView()
}
