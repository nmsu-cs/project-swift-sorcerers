//
//  ContentView.swift
//  ChordCraft
//
//

import SwiftUI

struct ContentView: View {
    @State var currentOption = 0     // State variable to track the current selected option
    
    let options: [Option] = [ // Options available in the list
        .init(title: "Projects", imageName: "folder.fill"),
        .init(title: "Settings", imageName: "gearshape")
    ]
    
    
    let views: [Int: AnyView] = [     // Mapping of option index to corresponding view
            0: AnyView(StartUpPage()),
            1: AnyView(Text("Testing Settings Tab"))
        ]
        
    var body: some View {
        NavigationView {
            // Display the list of options
            ListView(options: options, currentSelection: $currentOption)
            if let view = views[currentOption] {        // Display the view to the current selection
                view
                }
            }
        
        //.frame(idealWidth: 800, idealHeight: 400)
    }
}

#Preview {
    ContentView()
     //   .modelContainer(for: Item.self, inMemory: true)
}


