//
//  ContentView.swift
//  ChordCraft
//
//
import Cocoa
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [song]

    // variables to store input
    @State private var buttonText = "Add"
    @State private var songName: String = ""
    @State private var songG: String = ""
    @State var songkey: String = ""
    @State var songtempo: String = ""
    @State var startrate: String = ""
    @State var notesInput: String = ""

    // var for file path
    @State private var selectedFilePath: String?

    var body: some View {
        VStack(spacing: 20) {
            Text("ChordCraft V0.02")
                .font(.title)

            TextField("Song Name", text: $songName)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Song Genre", text: $songG)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Song Tempo", text: $songtempo)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Start Rating", text: $startrate)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Song Key", text: $songkey)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Song Notes", text: $notesInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
                openFileSelectionDialog()
            }) {
                Text("Select File")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            Button(action: {
                if addItem() {
                    self.buttonText = "Song added"
                } else {
                    self.buttonText = "Invalid, try again"
                }
            }) {
                Text(buttonText)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }

            Text("List of Songs Stored")
                .font(.headline)

            List(items) { item in
                VStack(alignment: .leading) {
                    Text(item.title)
                    Text("Genre: \(item.genre)")
                    Text("date: \(item.dateCreated)")
                    Text("tempo: \(item.tempo)")
                    Text("rating: \(item.starRating)")
                    Text("key: \(item.key)")
                    Text("notes: \(item.notes)")
                    Text("Path to MP3 file: \(item.filePath)")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
        .buttonStyle(PlainButtonStyle())
    }

    private func addItem() -> Bool {
        withAnimation {
            if let tempoin = Double(songtempo), let rating = Double(startrate) {
                let newItem = song(title: songName, filePath: selectedFilePath!, tempo: tempoin, genre: songG, key: songkey, starRating: rating, notes: notesInput)
                modelContext.insert(newItem)
                return true
            } else {
                return false // Return false if conversion fails
            }
        }
    } // end of add item function

    func openFileSelectionDialog() {
        let openPanel = NSOpenPanel()
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseFiles = true
        openPanel.canChooseDirectories = false

        openPanel.begin { result in
            if result.rawValue == NSApplication.ModalResponse.OK.rawValue {
                if let url = openPanel.urls.first {
                    let filePath = url.path
                    self.selectedFilePath = filePath
                }
            }
        }
    } // end of function open file
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
