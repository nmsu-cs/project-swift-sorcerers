//
//  AddsongForm.swift
//  ChordCraft
//
//
import Cocoa
import SwiftData
import SwiftUI

struct AddsongForm: View {
    @Binding var showingAddSongForm: Bool
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
    @State var stagein: String = ""

    // var for file path
    @State private var selectedFilePath: String?
    
    let stageOptions = ["Completed", "Mastering", "Mixing", "Ideas"]

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Button(action: {
                    // Define the action you want the button to perform here
                    print("Button was tapped")
                    self.showingAddSongForm = false
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title) // Optional: Adjust the size of the image
                        .foregroundColor(.gray) // Optional: Change the color of the image
                }
                Spacer()
            }
            Text("New Song")
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
            // Dropdown menu for stage selection
            // Segmented control for stage selection
            Picker(selection: $stagein, label: Text("Stage of Production")) {
                ForEach(stageOptions, id: \.self) { option in
                    Text(option)
                }
            }
            .pickerStyle(SegmentedPickerStyle()) // Apply segmented control style

           
            // end of selector
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
                    Text("Stage of production: \(item.stage)")

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
                let newItem = song(title: songName, filePath: selectedFilePath!, tempo: tempoin, genre: songG, key: songkey, starRating: rating, notes: notesInput, sta:  stagein)
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

    

struct AddsongForm_Previews: PreviewProvider {
    static var previews: some View {
        AddsongForm(showingAddSongForm: .constant(true))
            //.modelContainer(for: Item.self, inMemory: true)
            // Provide any required environment objects or settings here
    }
}

