//
//  songView.swift
//  ChordCraft
//
//  Created by Shokhina Jalilova on 4/20/24.
//


// actual variables
// for rating, we should have 5 images?

import SwiftUI
import AppKit

struct songView: View {
    @Binding var showingSongView: Bool
    @Binding var currentSong: song?
  
    @State private var editingTitle: Bool = false
    @State private var editingStage: Bool = false
    @State private var editingRating: Bool = false
    @State private var editingTempo: Bool = false
    @State private var editingGenre: Bool = false
    @State private var editingKey: Bool = false
    @State private var editingNotes: Bool = false
    
    @State private var songTitle: String = ""
    @State private var songStage: String = ""
    @State private var songKey: String = ""
    @State private var songGenre: String = ""
    @State private var songRating: Double = 0
    @State private var songRatingText: String = ""
    @State private var songTempo: Double = 0
    @State private var songTempoText: String = ""
    @State private var songNotesText: String = ""

    
    @State private var isHoveringTitle: Bool = false
    @State private var isHoveringStage: Bool = false
    @State private var isHoveringRating: Bool = false
    @State private var isHoveringTempo: Bool = false
    @State private var isHoveringGenre: Bool = false
    @State private var isHoveringKey: Bool = false
    @State private var isHoveringNotes: Bool = false
    
    // for drop down menu in stage
    let options = ["Completed", "Mastering", "Mixing", "Arranging", "Ideas"]
    
    func openFile(at path: String) {
            let url = URL(fileURLWithPath: path)
            NSWorkspace.shared.open(url)
        }
    
    var body: some View {
        
        
        
        ZStack {
            
       //      GeometryReader { geometry in
       //          Image("leaf")
       //              .resizable()
       //              .scaledToFill()
       //              .edgesIgnoringSafeArea(.all)
       //              .opacity(0.3)
       //              .frame(width: geometry.size.width, height: geometry.size.height)
       //              .blur(radius: 1.5)
       //              .clipped()
       //      }
            ScrollView {
              
                Spacer()
                Spacer()
                Spacer()
                ZStack {
                    
                    VStack(spacing: 20){
                        HStack {
                            Text("Song")
                                .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                                .fontWeight(.semibold)
                                .padding(.leading, 1.0)
                            
                            
                            Button(action: {
                                if let path = currentSong?.filePath {
                                    openFile(at: path)
                                } else {
                                    print("No file path available")
                                    // Optionally handle the error, e.g., show an alert
                                }
                            }) {
                                Image(systemName: "play.circle")
                                    .font(.title)
                                    .foregroundColor(.white)
                            }

                            
                            
                            Spacer()
                            
                            
                            Button(action: {
                                // Define the action you want the button to perform here
                                print("Button was tapped")
                                self.showingSongView = false
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .font(.title) // Optional: Adjust the size of the image
                                    .foregroundColor(.gray) // Optional: Change the color of the image
                                
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        HStack(spacing: 20){
                            Image(systemName: "folder.fill")
                                
                                .resizable()
                                .foregroundColor(.white) // Dynamic fill colo
                                .background(
                                    .ultraThinMaterial,
                                    in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                                 )
                                .opacity(0.2)
                                .frame(width: 80, height: 75)
                            
                            // title box
                            VStack {
                                ZStack(alignment: .topLeading) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(.white)
                                        .background(
                                            .ultraThinMaterial,
                                            in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                                         )
                                        .opacity(0.2)
                                        .frame(width: 150, height: 70)

                                    if editingTitle {
                                        VStack(alignment: .leading) {
                                            Text("Title")
                                                .bold()
                                                .padding()
                                                .padding(.top,-1)
                                            
                                            TextField("Enter title", text: $songTitle, onCommit: {
                                                currentSong?.title = songTitle
                                                editingTitle = false
                                            })
                                            .textFieldStyle(RoundedBorderTextFieldStyle())
                                            .frame(maxWidth: 120)
                                            .padding(.top, -22)
                                            .padding(.leading, 4)
                                            .onAppear {
                                                songTitle = currentSong?.title ?? ""
                                        }
                                        }
                                    } else {
                                        VStack(alignment: .leading) {
                                            HStack {
                                                Text("Title")
                                                    .bold()
                                                    .padding(.leading, 1)
                                                .padding(.top,14)
                                                
                                                //Spacer()
                                                
                                                Image(systemName: "pencil")
                                                    .padding(.leading,70)
                                                    .opacity(isHoveringTitle ? 1 : 0)
                                                    .animation(.default, value: isHoveringTitle)
                                                    .padding(.trailing, 1)
                                            }
                                            Text(currentSong?.title ?? "No Title ⚠️")
                                                .padding(.top,-4)
                                        }
                                        .padding(.horizontal)
                                        .onTapGesture {
                                            editingTitle = true
                                        }
                                    }
                                }
                                .onHover { hover in
                                               isHoveringTitle = hover
                                           }
                            }
                            
                            // stage box
                            VStack {
                                ZStack(alignment: .topLeading) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(.white)
                                        .background(
                                            .ultraThinMaterial,
                                            in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                                         )
                                        .opacity(0.2)
                                        .frame(width: 150, height: 70)

                                    if editingStage {
                                        VStack(alignment: .leading) {
                                            Text("Stage")
                                                .bold()
                                                .padding()
                                                .padding(.top,-1)
                                            
                                            Menu {
                                                                      ForEach(options, id: \.self) { option in
                                                                          Button(option, action: {
                                                                              currentSong?.stage = option
                                                                              editingStage = false
                                                                          })
                                                                      }
                                                                  } label: {
                                                                      Label(currentSong?.stage ?? "Select stage", systemImage: "chevron.down")
                                                                          .padding(.horizontal, 60)
                                                                          .padding(.top, 7)
                                                                          .padding(.bottom, 7)
                                                                          .background(Color.gray)
                                                                          .opacity(0.3)
                                                                          .cornerRadius(15)
                                                                          .frame(maxWidth: 40)
                                                                  }
                                        }
                                    } else {
                                        VStack(alignment: .leading) {
                                            HStack {
                                                Text("Stage")
                                                    .bold()
                                                    .padding(.leading, 1)
                                                .padding(.top,14)
                                                
                                                //Spacer()
                                                
                                                Image(systemName: "pencil")
                                                    .padding(.leading,56)
                                                    .opacity(isHoveringStage ? 1 : 0)
                                                    .animation(.default, value: isHoveringStage)
                                                    .padding(.trailing, 1)
                                            }
                                            Text(currentSong?.stage ?? "No stage ⚠️")
                                                .padding(.top,-4)
                                        }
                                        .padding(.horizontal)
                                        .onTapGesture {
                                            editingStage = true
                                        }
                                    }
                                }
                                .onHover { hover in
                                               isHoveringStage = hover
                                           }
                            }
                            
                            // rating box
                           
                            VStack {
                                ZStack(alignment: .topLeading) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(.white)
                                        .background(
                                            .ultraThinMaterial,
                                            in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                                         )
                                        .opacity(0.2)
                                        .frame(width: 150, height: 70)

                                    if editingRating {
                                        VStack(alignment: .leading) {
                                            Text("Rating")
                                                .bold()
                                                .padding()
                                                .padding(.top,-1)
                                            
                                            TextField("Enter rating", text: $songRatingText, onCommit: {
                                                if let rating = Double(songRatingText) {
                                                               currentSong?.starRating = rating
                                                           }
                                                editingRating = false
                                            })
                                            .textFieldStyle(RoundedBorderTextFieldStyle())
                                            .frame(maxWidth: 120)
                                            .padding(.top, -22)
                                            .padding(.leading, 4)
                                            .onAppear {
                                                if let rating = currentSong?.starRating {
                                                               songRatingText = String(rating)
                                                           }
                                        }
                                        }
                                    } else {
                                        VStack(alignment: .leading) {
                                            HStack() {
                                                Text("Rating")
                                                    .bold()
                                                    .padding(.leading, 1)
                                                    .padding(.top,14)
                                                    .lineLimit(1)  // Ensures the text does not wrap
                                                   // .frame(maxWidth: 200)
                                                    
                                                
                                                Spacer()
                                                
                                                Image(systemName: "pencil")
                                                   // .padding(.leading,70)
                                                    .opacity(isHoveringRating ? 1 : 0)
                                                    .animation(.default, value: isHoveringRating)
                                                    .padding(.trailing, 1)
                                            }
                                            Text(String(repeating: "★", count: Int(currentSong?.starRating ?? 0)))
                                                .padding(.top,-4)
                                        }
                                        .padding(.horizontal)
                                        .onTapGesture {
                                            editingRating = true
                                        }
                                    }
                                }
                                .onHover { hover in
                                               isHoveringRating = hover
                                           }
                            }
                            
                        } // end of top horizontal stack
                        
                        HStack(spacing: 20){
                            
                            // notes box
                            VStack {
                                ZStack(alignment: .topLeading) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(.white)
                                        .background(
                                            .ultraThinMaterial,
                                            in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                                         )
                                        .opacity(0.2)
                                        .frame(width: 250, height: 160)

                                    if editingNotes {
                                        VStack(alignment: .leading) {
                                            Text("Notes")
                                                .bold()
                                                .padding()
                                                .padding(.top,-1)
                                            
                                            TextField("Enter notes", text: $songNotesText, onCommit: {
                                                currentSong?.notes = songNotesText
                                                editingNotes = false
                                            })
                                            .textFieldStyle(RoundedBorderTextFieldStyle())
                                            .frame(maxWidth: 120)
                                            .padding(.top, -22)
                                            .padding(.leading, 4)
                                            .onAppear {
                                                songNotesText = currentSong?.notes ?? ""
                                        }
                                        }
                                    } else {
                                        VStack(alignment: .leading) {
                                            HStack {
                                                Text("Notes")
                                                    .bold()
                                                    .padding(.leading, 1)
                                                .padding(.top,14)
                                                
                                                Spacer()
                                                
                                                Image(systemName: "pencil")
                                                   // .padding(.leading,70)
                                                    .opacity(isHoveringNotes ? 1 : 0)
                                                    .animation(.default, value: isHoveringNotes)
                                                    .padding(.trailing, 1)
                                            }
                                            Text(currentSong?.notes ?? "No notes ⚠️")
                                                .padding(.top,-4)
                                        }
                                        .padding(.horizontal)
                                        .onTapGesture {
                                            editingNotes = true
                                        }
                                    }
                                }
                                .onHover { hover in
                                               isHoveringNotes = hover
                                           }
                            } // end of genre box
                            
                            
                            VStack (spacing: 20){
                                VStack{
                                    ZStack (alignment: .topLeading){
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(.white)
                                            .background(
                                                .ultraThinMaterial,
                                                in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                                             )
                                            .opacity(0.2)
                                            .frame(width: 150, height: 70)
                                        Text("Date created")
                                            .bold()
                                            .padding()
                                        
                                        Text(currentSong?.dateCreated ?? "Unknown")
                                            .padding()
                                            .offset(y: 20)
                                    }
                                } // date box
                                
                                // tempo box
                                VStack {
                                    ZStack(alignment: .topLeading) {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(.white)
                                            .background(
                                                .ultraThinMaterial,
                                                in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                                             )
                                            .opacity(0.2)
                                            .frame(width: 150, height: 70)

                                        if editingTempo {
                                            VStack(alignment: .leading) {
                                                Text("Tempo")
                                                    .bold()
                                                    .padding()
                                                    .padding(.top,-1)
                                                
                                                TextField("Enter tempo", text: $songTempoText, onCommit: {
                                                    if let tempo = Double(songTempoText) {
                                                                    currentSong?.tempo = tempo
                                                                } else {
                                                                    // Handle the case where the conversion fails
                                                                    print("Invalid number entered")
                                                                }
                                                    editingTempo = false
                                                })
                                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                                .frame(maxWidth: 120)
                                                .padding(.top, -22)
                                                .padding(.leading, 4)
                                                .onAppear {
                                                    if let tempo = currentSong?.tempo {
                                                        songTempoText = String(tempo)
                                                    }
                                                }
                                            }
                                        } else {
                                            VStack(alignment: .leading) {
                                                HStack {
                                                    Text("Tempo")
                                                        .bold()
                                                        .padding(.leading, 1)
                                                    .padding(.top,14)
                                                    
                                                    Spacer()
                                                    
                                                    Image(systemName: "pencil")
                                                       // .padding(.leading,70)
                                                        .opacity(isHoveringTempo ? 1 : 0)
                                                        .animation(.default, value: isHoveringTempo)
                                                        .padding(.trailing, 1)
                                                }
                                                Text(String(format: "%.1f", currentSong?.tempo ?? 0) + " BPM")
                                                    .padding(.top,-4)
                                            }
                                            .padding(.horizontal)
                                            .onTapGesture {
                                                editingTempo = true
                                            }
                                        }
                                    }
                                    .onHover { hover in
                                                   isHoveringTempo = hover
                                               }
                                }
                            } // end of tempo box
                            
                            
                            VStack (spacing: 20){
                                
                                // genre box
                                VStack {
                                    ZStack(alignment: .topLeading) {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(.white)
                                            .background(
                                                .ultraThinMaterial,
                                                in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                                             )
                                            .opacity(0.2)
                                            .frame(width: 150, height: 70)

                                        if editingGenre {
                                            VStack(alignment: .leading) {
                                                Text("Genre")
                                                    .bold()
                                                    .padding()
                                                    .padding(.top,-1)
                                                
                                                TextField("Enter genre", text: $songGenre, onCommit: {
                                                    currentSong?.genre = songGenre
                                                    editingGenre = false
                                                })
                                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                                .frame(maxWidth: 120)
                                                .padding(.top, -22)
                                                .padding(.leading, 4)
                                                .onAppear {
                                                    songGenre = currentSong?.genre ?? ""
                                            }
                                            }
                                        } else {
                                            VStack(alignment: .leading) {
                                                HStack {
                                                    Text("Genre")
                                                        .bold()
                                                        .padding(.leading, 1)
                                                    .padding(.top,14)
                                                    
                                                    Spacer()
                                                    
                                                    Image(systemName: "pencil")
                                                       // .padding(.leading,70)
                                                        .opacity(isHoveringGenre ? 1 : 0)
                                                        .animation(.default, value: isHoveringGenre)
                                                        .padding(.trailing, 1)
                                                }
                                                Text(currentSong?.genre ?? "No genre ⚠️")
                                                    .padding(.top,-4)
                                            }
                                            .padding(.horizontal)
                                            .onTapGesture {
                                                editingGenre = true
                                            }
                                        }
                                    }
                                    .onHover { hover in
                                                   isHoveringGenre = hover
                                               }
                                } // end of genre box
                                
                                // key box
                                VStack {
                                    ZStack(alignment: .topLeading) {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(.white)
                                            .background(
                                                .ultraThinMaterial,
                                                in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                                             )
                                            .opacity(0.2)
                                            .frame(width: 150, height: 70)

                                        if editingKey {
                                            VStack(alignment: .leading) {
                                                Text("Key")
                                                    .bold()
                                                    .padding()
                                                    .padding(.top,-1)
                                                
                                                TextField("Enter key", text: $songKey, onCommit: {
                                                    currentSong?.key = songKey
                                                    editingKey = false
                                                })
                                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                                .frame(maxWidth: 120)
                                                .padding(.top, -22)
                                                .padding(.leading, 4)
                                                .onAppear {
                                                    songKey = currentSong?.key ?? ""
                                            }
                                            }
                                        } else {
                                            VStack(alignment: .leading) {
                                                HStack {
                                                    Text("Key")
                                                        .bold()
                                                        .padding(.leading, 1)
                                                    .padding(.top,14)
                                                    
                                                    Spacer()
                                                    
                                                    Image(systemName: "pencil")
                                                       // .padding(.leading,70)
                                                        .opacity(isHoveringKey ? 1 : 0)
                                                        .animation(.default, value: isHoveringKey)
                                                        .padding(.trailing, 1)
                                                }
                                                Text(currentSong?.key ?? "No Key ⚠️")
                                                    .padding(.top,-4)
                                            }
                                            .padding(.horizontal)
                                            .onTapGesture {
                                                editingKey = true
                                            }
                                        }
                                    }
                                    .onHover { hover in
                                                   isHoveringKey = hover
                                               }
                                } // end of key box
                            }
                        } // end of bottom horizontal
                        
                    }
                    .frame(maxWidth: 600)
                }
            }
            //.foregroundColor(colorScheme == .dark ? .black : .white)
        }
       
        
    }
}

struct songView_Previews: PreviewProvider {
    static var previews: some View {
        // Make the sample song optional 
             let sampleSong: song? = song(title: "Good Morning", filePath: "asdfasdf", tempo: 120, genre: "Rap", key: "F# Minor", starRating: 3, notes: "A great song", sta: "Completed")
             
             // Create a constant binding to an optional song
             let songBinding = Binding.constant(sampleSong)
             
             // Create a constant binding for showingSongView
             let showingSongViewBinding = Binding.constant(true)
             
             // Now include showingSongView in the songView initializer
             songView(showingSongView: showingSongViewBinding, currentSong: songBinding)
                 .frame(width: 700, height: 400)
    }
}

