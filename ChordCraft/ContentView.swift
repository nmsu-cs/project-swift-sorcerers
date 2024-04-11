//
//  ContentView.swift
//  ChordCraft
//
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    // variables to store input
    @State private var buttonText = "Add"
    @State private var songName: String = ""
    @State private var songG: String = ""
    var body: some View {
        VStack {
            // text boxes to take input
            Text("ChordCraft V0.02")
                .font(.title)
                .padding()
            TextField("enter song Name", text: $songName)
            TextField("Enter song genre", text: $songG)
                .padding()

            // button logic
            Button(action: {
                if addItem() {
                    self.buttonText = "Song added" // Update buttonText when button is tapped
                } else {
                    self.buttonText = "Invalid,try again"
                }
            }) {
                Text(buttonText)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            } // end of buttton
            Text("list of songs Stored")
            List { ForEach(items) { item in Text(item.name) }
            } // end of list
            List { ForEach(items) { item in Text(item.day) }
            } // end of list of genre
        }
        .buttonStyle(PlainButtonStyle())
        .padding()
    }

    private func addItem() -> Bool {
        withAnimation {
            let newItem = Item(n: songName, g: songG)
            modelContext.insert(newItem)
            return true
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
