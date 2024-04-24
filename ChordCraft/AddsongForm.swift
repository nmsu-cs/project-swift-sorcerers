//
//  AddsongForm.swift
//  ChordCraft
//
//
import Cocoa
import SwiftData
import SwiftUI


struct DropdownMenuView: View {
    @Binding var selectedOption: String
    let options = ["Completed", "Mastering", "Mixing", "Arranging", "Ideas"]
    let initialText: String = "Select an Option"

    var body: some View {
        Menu {
            ForEach(options, id: \.self) { option in
                Button(option, action: {
                    selectedOption = option
                })
            }
        } label: {
            Label(selectedOption == "" ? initialText : selectedOption, systemImage: "chevron.down")
                .padding(.horizontal, 60)
                .padding(.top, 7)
                .padding(.bottom, 7)
                .background(.gray)
                .opacity(0.3)
                .cornerRadius(15)
                
        }
        
    }
}

struct myRoundedTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(5)
            .background(.gray)
            .cornerRadius(15)
            .opacity(0.3)
            
            
    }
}

struct myRoundedTextFieldStyle2: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(50)
            .background(.gray)
            .cornerRadius(15)
            .opacity(0.3)
            
            
    }
}

struct AddsongForm: View {
    @Binding var showingAddSongForm: Bool
    @Environment(\.modelContext) public var modelContext // where songs are getting stored
    @Query private var songs: [song] // where songs are stored

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
    
   // let stageOptions = ["Completed", "Mastering", "Mixing","Arranging", "Ideas"]

    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                
                Spacer()
                Button(action: {
                    // Define the action you want the button to perform here
                    print("Button was tapped")
                    self.showingAddSongForm = false
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title) // Optional: Adjust the size of the image
                        .foregroundColor(.gray) // Optional: Change the color of the image
                    
                }
            }
            
            HStack {
                Text("New Song")
                    .font(.title)
                Image(systemName: "music.note")
                    .font(.system(size: 18))
                
                
                Spacer()
                
            }
            
            HStack {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .frame(height: 3)
                .opacity(0.4)
                Spacer()
            }
            HStack {
                
                // left side
                VStack{
                    
                    VStack {
                        HStack {
                            Text("Title")
                                .font(.title2)
                            Spacer()
                        }
                        TextField("Song Name", text: $songName)
                            .textFieldStyle(myRoundedTextFieldStyle())
                        
                          
                    }
                    .padding(.bottom, 20)
                    
                   
                    
                    VStack {
                        HStack {
                            Text("Genre")
                                .font(.title2)
                            Spacer()
                        }
                        TextField("Song Genre", text: $songG)
                            .textFieldStyle(myRoundedTextFieldStyle())
                    }
                    .padding(.bottom, 20)
                    
                   
                    
                    VStack {
                        HStack {
                            Text("Tempo")
                                .font(.title2)
                            Spacer()
                            
                           
                        }
                        TextField("Song Tempo", text: $songtempo)
                            .textFieldStyle(myRoundedTextFieldStyle())
                    }
                    .padding(.bottom, 20)
                    
                    VStack {
                        HStack {
                            Text("Rating")
                                .font(.title2)
                            Spacer()
                        }
                        
                        TextField("Start Rating", text: $startrate)
                            .textFieldStyle(myRoundedTextFieldStyle())
                        
                    }
                    .padding(.bottom, 20)
                    
                    VStack {
                        HStack {
                            Text("Key")
                                .font(.title2)
                            Spacer()
                        }
                        TextField("Song Key", text: $songkey)
                            .textFieldStyle(myRoundedTextFieldStyle())
                    }
                    .padding(.bottom, 20)
                    
                   
                    
                } // end of left side vstack
                
                
                Spacer()
                Spacer()
                Spacer()
                
                // start of right side vstack
                VStack {
                    
                    VStack {
                        HStack {
                            Text("Notes")
                                .font(.title2)
                            Spacer()
                        }
                        
                        TextField("Song Notes", text: $notesInput)
                            .textFieldStyle(myRoundedTextFieldStyle2())
                    }
                    .padding(.bottom, 20)
                    
                    VStack {
                        HStack{
                            Text("Stage of production")
                                .font(.title2)
                            Spacer()
                            
                            
                        }
                     
                        HStack {
                            DropdownMenuView(selectedOption: $stagein)
                            Spacer()
                        }
                        
                    }
                    .padding(.bottom, 20)
                    
                    
                    VStack {
                        HStack{
                            Text("Select file")
                                .font(.title2)
                            Spacer()
                            
                            
                        }
                     
                        HStack {
                            Button(action: {
                                openFileSelectionDialog()
                            }) {
                                Label {
                                    Image(systemName: "doc.badge.plus")
                                         .font(.system(size: 18))
                                } icon: {
                                   
                                }
                                .padding()  // Apply padding to the entire Label
                                .background(Color.gray.opacity(0.4))  // Background applied to the entire Label
                                .foregroundColor(.white)  // Foreground color applied to the entire Label
                                .cornerRadius(10)  // Corner radius applied to the entire Label
                            }

                            Spacer()
                        }
                        
                    }
                    .padding(.bottom, 20)
                    
                    
                   
                    Spacer()
                    Spacer()
                } // end of right side vstack
                .padding()
                
                Spacer()
                
                
               
            } // end of hstack
            
                HStack {
                    Button(action: {
                        if addItem() {
                                    self.buttonText = "Song added!"
                                } else {
                                    self.buttonText = "failed, try again"
                                }
                    }) {
                        
                        Text(buttonText)
                            .padding(.horizontal, 100)
                            .padding(.vertical)
                            .background(Color.gray.opacity(0.4))  // Background applied to the entire Label
                            .foregroundColor(.white)  // Foreground color applied to the entire Label
                            .cornerRadius(10)  // Corner radius applied to the entire Label
                    
                        
                    }
                    
                }
            
           
            // Dropdown menu for stage selection
            // Segmented control for stage selection
      //      Picker(selection: $stagein, label: Text("Stage of Production")) {
      //          ForEach(stageOptions, id: \.self) { option in
      //              Text(option)
      //          }
      //      }
      //      .pickerStyle(SegmentedPickerStyle()) // Apply segmented control style
      //
            
            // end of selector
       //     Button(action: {
       //         openFileSelectionDialog()
       //     }) {
       //         Text("Select File")
       //             .padding()
       //             .foregroundColor(.white)
       //             .background(Color.blue)
       //             .cornerRadius(10)
       //     }
       //     Button(action: {
       //         if addItem() {
       //             self.buttonText = "Song added"
       //         } else {
       //             self.buttonText = "Invalid, try again"
       //         }
       //     }) {
       //         Text(buttonText)
       //             .padding()
       //             .foregroundColor(.white)
       //             .background(Color.blue)
       //             .cornerRadius(10)
       //     }
            
            //     Text("List of Songs Stored")
            //         .font(.headline)
            
            //     List(songs) { item in
            //         VStack(alignment: .leading) {
            //             Text(item.title)
            //             Text("Genre: \(item.genre)")
            //             Text("date: \(item.dateCreated)")
            //             Text("tempo: \(item.tempo)")
            //             Text("rating: \(item.starRating)")
            //             Text("key: \(item.key)")
            //             Text("notes: \(item.notes)")
            //             Text("Path to file: \(item.filePath)")
            //             Text("Stage of production: \(item.stage)")
            
            //                 .foregroundColor(.gray)
            //         }
        
            // }
        } // end of v stack
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
            .frame(width: 800, height: 700)  // Specifies the frame size for the view
                       .previewLayout(.sizeThatFits)
         //   .modelContainer(for: Item.self, inMemory: false)    // comented out to fix preview and make it visible
            // Provide any required environment objects or settings here
    }
}

