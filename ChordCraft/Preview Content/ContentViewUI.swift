//
//  ContentViewUI.swift
//  ChordCraft
//
//  Created by Austin Martin on 3/27/24.
//

import SwiftUI

struct ContentViewUI: View {
    @State var currentOption = 0     // State variable to track the current selected option
    
    let options: [Option] = [ // Options available in the list
        .init(title: "Projects", imageName: "folder.fill"),
        .init(title: "Samples", imageName: "music.note.list"),
        .init(title: "Plugins", imageName: "powerplug.fill"),
        .init(title: "Settings", imageName: "gear")]
    
    
    let views: [Int: AnyView] = [     // Mapping of option index to corresponding view

            0: AnyView(MainView()),
            1: AnyView(Text("Testing Samples Tab")),
            2: AnyView(Text("Testing Plugins Tab")),
            3: AnyView(Text("Testing Settings Tab"))
        ]
        
        var body: some View {
            NavigationView {        // Display the list of options
                ListView(options: options, currentSelection: $currentOption)
                if let view = views[currentOption] {        // Display the view to the current selection
                    view
                }
            }
            .frame(minWidth: 600, minHeight: 400)
    }
}

#Preview {
    ContentViewUI()
}
