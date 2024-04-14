//
//  ChordCraftApp.swift
//  ChordCraft
//
//

import SwiftUI
import SwiftData

@main
struct ChordCraftApp: App {
    // inital model setup for database
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(HiddenTitleBarWindowStyle()) // hides the title bar
        .modelContainer(sharedModelContainer)
        
    }
   
}
