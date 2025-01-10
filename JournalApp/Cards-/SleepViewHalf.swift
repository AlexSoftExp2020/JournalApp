//
//  SleepViewHalf.swift
//  JournalApp
//
//  Created by Oleksii on 10.01.2025.
//

import SwiftUI

struct SleepViewHalf: View {
    @Binding var value: Double
    var isEditing: Bool
    var fontStyle: JournalFont
    
    var body: some View {
        VStack {
            Text("Hours Slept")
                .foregroundColor(.darkBrown)
                .font(fontStyle.uiFont(15))
            //#-learning-code-snippet(6.frameAlignment)
            
            Text("\(Int(value))")
                .foregroundColor(.darkBrown)
                .modifier(FontStyle(size: 50))
            //#-learning-code-snippet(5.paddingSleep)
            
            //#-learning-code-snippet(5.stepper)
        }
        //#-learning-code-snippet(5.sleepFrame)
        //#-learning-code-snippet(6.paddingCard)
    }
}

#Preview {
    //MARK: TODO - SleepViewHalfPreview
}
