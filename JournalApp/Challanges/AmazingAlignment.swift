//
//  AmazingAlignment.swift
//  JournalApp
//
//  Created by Oleksii on 03.01.2025.
//

import SwiftUI

struct AmazingAlignment: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "books.vertical.fill")
                .font(.system(size: 40))
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 10)
            VStack(alignment: .trailing) {
                Image(systemName: "books.vertical.fill").font(.system(size: 40))
                
                Rectangle().frame(maxWidth: .infinity, maxHeight: 10)
            }
            Image(systemName: "books.vertical.fill").font(.system(size: 40)).frame(maxWidth: .infinity, alignment: .trailing)
            Rectangle().frame(maxWidth: .infinity, maxHeight: 10)
            HStack(spacing: 20) {
                Spacer()
                Image(systemName: "books.vertical.fill")
                    .font(.system(size: 40))
                    .background(Color.yellow)
                Image(systemName: "books.vertical.fill")
                    .font(.system(size: 40))
                    .padding(.trailing, 20)
            }
            .background(Color.mint)
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 10)
        }
        .padding(.horizontal)
        .frame(width: 250).border(Color.black)
    }
}

#Preview {
    AmazingAlignment()
}
