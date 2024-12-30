//
//  Entry.swift
//  JournalApp
//
//  Created by Oleksii on 28.12.2024.
//

import SwiftUI

enum JournalFont: String, CaseIterable, Codable {
    case font1 = "SF Pro Rounded"
    case font2 = "Bradley Hand"
    case font3 = "Times New Roman"
}

enum JournalTheme: String, CaseIterable, Codable {
    case line
    case curve
    case dot
    case ray
    case wave
}
