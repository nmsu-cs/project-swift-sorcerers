//
//  ChordCraftApp.swift
//  ChordCraft
//
//

import SwiftData
import SwiftUI

@main
struct ChordCraftApp: App {
    // inital model setup for database
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            song.self, Project.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false) // set  isStoredInMemoryOnly to false  to keep stuff forever,

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
           // AddsongForm()
          // ContentView() // main
           showSongsTest()
        //AddProjectForm()
        }
        .windowStyle(HiddenTitleBarWindowStyle()) // hides the title bar
        .modelContainer(sharedModelContainer)
        
    }
   
}
