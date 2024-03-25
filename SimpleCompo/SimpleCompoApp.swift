//
//  SimpleCompoApp.swift
//  SimpleCompo
//
//  Created by Juan Torres on 3/21/24.
//

import SwiftUI
import Foundation
@main
struct SimpleCompoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

func createFolder(folderName: String) -> Bool {
    let fileManager = FileManager.default
    let homeDirectory = fileManager.homeDirectoryForCurrentUser

    // Check if folder name is empty
    guard !folderName.isEmpty else {
        print("Invalid folder name.")
        return false
    }

    let folderURL = homeDirectory.appendingPathComponent(folderName)
    
    do {
        // Create folder
        try fileManager.createDirectory(at: folderURL, withIntermediateDirectories: true, attributes: nil)
        print("Folder created successfully.")
        return true
    } catch {
        print("Error creating folder: \(error.localizedDescription)")
        return false
    }
}


// Call the function to create the folder
