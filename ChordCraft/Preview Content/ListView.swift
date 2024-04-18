
//
//  Created on 3/23/24.
//

import SwiftUI

struct Option: Hashable { // Defines a struct to represent an option with a title and an image name
    let title: String
    let imageName: String
}

struct SubsectionView: View {
    let title: String
    let items: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.title)
                .padding(.bottom, 5)

            HStack {
                ForEach(items, id: \.self) { (item: String) in
                    Text(item)
                        .padding(.horizontal, 8) // Add horizontal padding between items
                        .background(Color.blue) // Add background color for better visibility
                        .foregroundColor(.white) // Set text color to white
                        .cornerRadius(8) // Add corner radius for rounded appearance
                }
            }
            .frame(maxWidth: .infinity) // Fill up all available horizontal space
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

struct MainView: View {
    var body: some View {
        VStack {
            HStack {
                SubsectionView(title: "Subsection 1", items: ["Item 1", "Item 2", "item 3", "item 4"])
                Spacer()
            }
            .padding()
            HStack {
                SubsectionView(title: "Subsection 2", items: ["Item 3", "Item 4", "Item 5"])
                Spacer()
            }
            .padding()
            HStack {
                SubsectionView(title: "Subsection 3", items: ["Item 6", "Item 7", "Item 8", "Item 9"])
                Spacer()
            }
            .padding()
        }
        .padding()
        Spacer()
    }
}

struct ListView: View {
    let options: [Option] // Options available in the list
    @State var currentSelection: Int // Binding to track the current selection
    var body: some View {
        VStack {
            let current = options[currentSelection] // Get the currently selected option
            ForEach(options, id: \.self) { option in // Display each option in a row

                HStack {
                    Spacer()
                    Text(option.title)
                        .foregroundColor(current == option ? Color(.blue) : Color(.white))
                    Spacer()
                    Image(systemName: option.imageName) // Display the option's image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 15)
                    Spacer()
                }
                .padding(8)
                .onTapGesture { // Handle tap gesture on an option
                    // Get the index of the tapped option
                    if let tappedIndex = self.options.firstIndex(where: { $0 == option }) {
                        self.currentSelection = tappedIndex // Updates the currentSelection
                    }
                }
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AddsongForm()
    }
}
