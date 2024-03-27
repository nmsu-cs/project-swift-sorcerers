
//
//  Created by Austin Martin on 3/23/24.
//

import SwiftUI
struct Option: Hashable { // Defines a struct to represent an option with a title and an image name
    let title: String
    let imageName: String
}


struct MainView: View {
    @State private var textFieldInput: String = ""
    @State private var buttonText = "create"
    @State private var showPrompt = false

    var body: some View {
        VStack {
            if showPrompt {   // Display a text field if showPrompt is true
                TextField("Enter Project Name", text: $textFieldInput)
                    .padding()
            }
            
            Button(action: {    // Display a button to toggle the showPrompt
                if !showPrompt {
                    showPrompt = true
                } else {       // Perform an action when the button is tapped
                    let created = createFolder(folderName: self.textFieldInput)
                    print("Button tapped")
                    if(created) {
                        self.buttonText = "folder was created"
                        showPrompt = false
                    } else {
                        self.buttonText = "invalid, try again"
                    }
                }
            }) {
                if !showPrompt {        // Show different content based on the showPrompt state
                    Image(systemName: "folder.fill.badge.plus")
                } else {
                    Text("Create")
                }
            }
        }
    }
}

struct ListView: View {
    let options: [Option]    // Options available in the list
    @Binding var currentSelection: Int    // Binding to track the current selection
    var body: some View {
        VStack {
            let current = options[currentSelection]     // Get the currently selected option
            ForEach(options, id: \.self) { option in    // Display each option in a row

                HStack {
                    Spacer()
                    Text(option.title)
                        .foregroundColor(current == option ? Color(.blue) : Color(.white))
                    Spacer()
                    Image(systemName: option.imageName)  // Display the option's image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 15)
                    Spacer()
                }
                .padding(8)
                .onTapGesture {    // Handle tap gesture on an option
                                    // Get the index of the tapped option
                    if let tappedIndex = self.options.firstIndex(where: { $0 == option }) {
                        self.currentSelection = tappedIndex    // Updates the currentSelection
                    }
                
                }
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
