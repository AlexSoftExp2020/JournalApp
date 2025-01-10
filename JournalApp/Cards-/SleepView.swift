//
//  SleepView.swift
//  JournalApp
//
//  Created by Oleksii on 10.01.2025.
//

import SwiftUI

struct SleepView: View {
    @Binding var value: Double
    var isEditing: Bool
    var fontStyle: JournalFont
    var size: CardSize
    
    static var disableSleepViewHalf = false
    
    var body: some View {
        if size == .small {
            SleepViewHalf(value: $value, isEditing: isEditing, fontStyle: fontStyle)
        } else {
            // MARK: TODO - SleepViewFull(...
        }
    }
}
