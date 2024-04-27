import SwiftUI
import SwiftData

struct Option: Hashable { // Defines a struct to represent an option with a title and an image name
    let title: String
    let imageName: String
}

struct addButton: View {
    var action: () -> Void
    @State private var isHovering = false

    var body: some View {
        Button(action: action) {
            Image(systemName: "plus")
                .font(.system(size: isHovering ? 21 : 20))
                .foregroundColor(isHovering ? .black.opacity(0.8) : .gray)
        }
        .frame(width: 30, height: 30)
        .buttonStyle(.plain)
        .background(isHovering ? Color.gray.opacity(0.2) : Color.clear)
        .cornerRadius(5)
        .onHover { hover in
            withAnimation(.easeInOut) {
                isHovering = hover
            }
        }
    }
}


// information in row
struct SubsectionView: View {
    @State private var isExpanded: Bool = true
    @State private var selectedSong: song?
    @State private var showingSongView = false
    
    let title: String
    let songs: [song]
   
    var body: some View {
        VStack(alignment: .leading) {
            // row title
            HStack {
                Text(title)
                   // .padding(.leading, -4)
                   // .padding(.top, -30)
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(Color.gray)
               // .border(.blue)
                
                Button(action: {
                                  withAnimation {
                                      isExpanded.toggle()
                                  }
                              }) {
                                  Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                                      .foregroundColor(.white)
                                      .padding(.horizontal)
                                      .font(.system(size: 13))
                              }
                              .buttonStyle(PlainButtonStyle())
            }
            
            // songs
            if isExpanded {
                ScrollView(.horizontal, showsIndicators: true) {
                             HStack(spacing: 20) {
                                 ForEach(songs) { song in
                                     Button(action: {
                                         self.selectedSong = song
                                         showingSongView = true
                                     }) {
                                         VStack {
                                             HStack {
                                                 Image(systemName: "folder.fill")
                                                     .padding()
                                             }
                                             Text(song.title)
                                         }
                                     }
                                 } // end of for each
                             }
                            
                         }
                .sheet(isPresented: $showingSongView) {
                //    if let currentSong = selectedSong {
                //        songView(currentSong: currentSong)
                //    }
                    songView(showingSongView: $showingSongView)
                        .frame(width: 700, height: 400)
                }
                         .frame(maxWidth: .infinity)
                       
                      } // end of if
        }
        // .border(.orange)
        .padding()
        .cornerRadius(10)
       
        
        }
    }
    



struct MainView : View {
    @State private var headerMessage: String = ""
    @State private var showingAddSongForm = false
    @Query private var songs: [song] // where songs are stored
    
    var body: some View {
        ZStack{
           
            GeometryReader { geometry in
                Image("leaf")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.3)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .blur(radius: 1.5)
                    .clipped()
            }
        ScrollView {
           
                
                //Color.black.background()
                VStack {
                    
                   
                    Spacer()
                    Text(headerMessage).font(.largeTitle)
                        .fontWeight(.semibold)
                        //.border(.pink)
                        .frame(maxWidth: .infinity, idealHeight: 40, alignment: .leading)
                        //.border(.blue)
                        .padding(.leading)
                        .onAppear(perform: updateHeaderMessage) // calls function
                        Spacer()
                        Spacer()
                            HStack {
                                // Project title
                                Text("Midnights").font(.title).fontWeight(.medium).padding(.leading)
                                Spacer()
                                addButton(action: {
                                    // Your action code here, for example:
                                    print("Button tapped")
                                    showingAddSongForm = true
                                    
                                })
                                .padding(.bottom,-20)
                            } // end of hstack
                            .sheet(isPresented: $showingAddSongForm) {
                      AddsongForm(showingAddSongForm: $showingAddSongForm)
                                    .frame(width: 800, height: 700)
                    }
                           
                    
                            HStack {
                            // project by
                            Text("Taylor Swift").font(.headline).fontWeight(.thin)
                                             .padding(.leading, 17.0)
                            Spacer()
                            }
                    /*
                    Divider().frame(height: 2).foregroundColor(Color.white)
                    */
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .padding(.leading, 16.0)
                        .frame(height: 3)
                        .opacity(0.4)
                    
                    Spacer()
                    Spacer()
                        
                    let completedSongs = songs.filter {$0.stage == "Completed"}
                    // loading rows in view
                    // completed row
                    ZStack {
                        RoundedRectangle(cornerRadius: 15,style: .continuous)
                            .background(
                                .ultraThinMaterial,
                                in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                             )
                            .opacity(0.1)
                            .padding(.leading, 8.0)
                        HStack {
                            SubsectionView(title: "Completed", songs: completedSongs)
                            Spacer()
                            
                           
                           // Image(systemName: "plus")
                           // addButton(action: {
                                // Your action code here, for example:
                           //     print("Button tapped")
                           // })

                          
                        }
                        .padding()
                       // .border(.blue)
                    }
                    Spacer()
                    Spacer()
                    // Mastering row
                    let masteredSongs = songs.filter {$0.stage == "Mastering"}
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 15,style: .continuous)
                            .background(
                                .ultraThinMaterial,
                                in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                             )
                            .opacity(0.1)
                            .padding(.leading, 8.0)
                        HStack {
                            SubsectionView(title: "Mastering", songs: masteredSongs)
                            Spacer()
                            
                           // addButton(action: {
                           //     // Your action code here, for example:
                           //     print("Button tapped")
                           // })
                            
                        }
                        
                        .padding()
                    }
                    Spacer()
                    Spacer()
                    
                    // mixing row
                    let mixedSongs = songs.filter {$0.stage == "Mixing"}
                    ZStack {
                        RoundedRectangle(cornerRadius: 15,style: .continuous)
                            .background(
                                .ultraThinMaterial,
                                in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                             )
                            .opacity(0.1)
                            .padding(.leading, 8.0)
                        HStack {
                            SubsectionView(title: "Mixing", songs: mixedSongs)
                            Spacer()
                          //  addButton(action: {
                          //      // Your action code here, for example:
                          //      print("Button tapped")
                          //      showingAddSongForm = true
                          //
                          //  })
                        }
                        //.sheet(isPresented: $showingAddSongForm) {
                        //    AddsongForm(showingAddSongForm: $showingAddSongForm)
                        //}
                        .padding()
                        
                       
                    }
                    Spacer()
                    Spacer()
                    // arranging row
                    let arrangingSongs = songs.filter {$0.stage == "Arranging"}
                    ZStack {
                        RoundedRectangle(cornerRadius: 15,style: .continuous)
                            .background(
                                .ultraThinMaterial,
                                in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                             )
                            .opacity(0.1)
                            .padding(.leading, 8.0)
                        HStack {
                            SubsectionView(title: "Arranging", songs: arrangingSongs)
                            Spacer()
                            
                           
                           // Image(systemName: "plus")
                          //  addButton(action: {
                          //      // Your action code here, for example:
                          //      print("Button tapped")
                          //  })

                          
                        }
                        .padding()
                       // .border(.blue)
                    }
                    
                    Spacer()
                    Spacer()
                    
                    // ideas row
                    let ideaSongs = songs.filter {$0.stage == "Ideas"}
                    ZStack {
                        RoundedRectangle(cornerRadius: 15,style: .continuous)
                            .background(
                                .ultraThinMaterial,
                                in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                             )
                            .opacity(0.1)
                            .padding(.leading, 8.0)
                        HStack {
                            SubsectionView(title: "Ideas", songs: ideaSongs)
                            Spacer()
                            
                           
                           // Image(systemName: "plus")
                          //  addButton(action: {
                          //      // Your action code here, for example:
                          //      print("Button tapped")
                          //  })

                          
                        }
                        .padding()
                       // .border(.blue)
                    }
                    Spacer()
                    Spacer()
                    
                    // WE ARE SO BACK
                    // all row this where im trying to insert the songs from the db
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 15,style: .continuous)
                            .background(
                                .ultraThinMaterial,
                                in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                             )
                            .opacity(0.1)
                            .padding(.leading, 8.0)
                        HStack {
                            SubsectionView(title: "All", songs: songs)
                            Spacer()
                            
                           
                           // Image(systemName: "plus")
                          //  addButton(action: {
                          //      // Your action code here, for example:
                          //      print("Button tapped")
                          //  })

                          
                        }
                        .padding()
                       // .border(.blue)
                    }
             

                   
                }
                
                .padding()
                Spacer()
                
               
            }
            
        }
        
    }
    
    func updateHeaderMessage() {
           let currentTime = Date()
           let calendar = Calendar.current
           let hour = calendar.component(.hour, from: currentTime)
           
           if hour >= 3 && hour < 12 {
               headerMessage = "Good Morning! ☀️"
           } else if hour >= 12 && hour < 18 {
               headerMessage = "Good Afternoon! ⛱️"
           } else {
               headerMessage = "Good Evening! 🌙"
           }
       }
}

// side bar
struct ListView: View {
    let options: [Option]    // Options available in the list
    @Binding var currentSelection: Int    // Binding to track the current selection
    
    var body: some View {
        VStack {
            //..
            
            Text("Chord Craft").font(.largeTitle).fontWeight(.semibold).padding(.top, 28).padding(.leading, -10)
            //Divider()
            ForEach(options.indices, id: \.self) { index in    // Display each option in a row
                let option = options[index]     // Gets the currently selected option
                HStack {
                    Spacer()
                    Text(option.title)
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(index == currentSelection ? Color(.white) : Color(.gray))
                    Spacer()
                    Image(systemName: option.imageName)  // Displays the option's image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 15)
                    Spacer()
                }
                .padding(.leading, -19)
                .onTapGesture {    // Handle tap gesture on an option
                    currentSelection = index
                    }
            }
            Spacer()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .frame(width: 900, height: 600)  // Specifies the frame size for the view
                       .previewLayout(.sizeThatFits)
    }
}



struct ListView_Previews: PreviewProvider {
    @State static var currentSelection = 0
    static var previews: some View {
        ListView(options: [
            Option(title: "Projects", imageName: "folder.fill"),
            Option(title: "Settings", imageName: "gearshape")
        ], currentSelection: $currentSelection)
    }
}

