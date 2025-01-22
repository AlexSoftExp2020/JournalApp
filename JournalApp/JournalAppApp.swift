//
//  JournalAppApp.swift
//  JournalApp
//
//  Created by Oleksii on 27.12.2024.
//

import SwiftUI

@main
struct JournalAppApp: App {
    @StateObject var journalData = JournalData()
    var body: some Scene {
        WindowGroup {
            EntryList(journalData: journalData)
                .task {
                    journalData.load()
                }
                .onChange(of: journalData.entries) { _, _ in
                    journalData.save()
                }
        }
    }
}
