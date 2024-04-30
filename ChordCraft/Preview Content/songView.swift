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
    @State private var confirmDelete = false
   // @Environment(\.colorScheme) var colorScheme
    //var currentSong: song
    
    func openFile(at path: String) {
            let url = URL(fileURLWithPath: path)
            NSWorkspace.shared.open(url)
        }
    
    // delete logic, error with getting permission to access files
    func removeItem() {
            guard let path = currentSong?.filePath else {
                print("No song selected")
                return
            }

            let fileManager = FileManager.default
            let url = URL(fileURLWithPath: path)
            do {
                try fileManager.removeItem(at: url)
                print("Folder deleted success")
                showingSongView = false // Set showingSongView to false after deletion
            } catch {
                print("Error deleting the folder: \(error.localizedDescription)")
                // Handle any errors that occur during deletion
            }
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
                            VStack{
                                ZStack(alignment: .topLeading)
                                {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(.white)
                                        .background(
                                            .ultraThinMaterial,
                                            in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                                         )
                                        .opacity(0.2)
                                        .frame(width: 150, height: 70)
                                    Text("Title")
                                        .bold()
                                        .padding()
                                    
                                    Text(currentSong?.title ?? "No Title ⚠️")
                                        .padding()
                                        .offset(y: 20)
                                }
                            } // title box
                            VStack{
                                ZStack(alignment: .topLeading){
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(.white)
                                        .background(
                                            .ultraThinMaterial,
                                            in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                                         )
                                        .opacity(0.2)
                                        .frame(width: 150, height: 70)
                                    Text("Stage")
                                        .bold()
                                        .padding()
                                    
                                    Text(currentSong?.stage ?? "No Stage ⚠️")
                                        .padding()
                                        .offset(y: 20)
                                        
                                }
                            } // stage box
                            VStack{
                                ZStack(alignment: .topLeading){
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(.white)
                                        .background(
                                            .ultraThinMaterial,
                                            in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                                         )
                                        .opacity(0.2)
                                        .frame(width: 150, height: 70)
                                    Text("Rating")
                                        .bold()
                                        .padding()
                                    
                                    Text(String(repeating: "★", count: Int(currentSong?.starRating ?? 0)))
                                        .padding()
                                        .offset(y: 20)
                                }
                            } // rating box
                        } // end of top horizontal
                        
                        HStack(spacing: 20){
                            VStack{
                                ZStack (alignment: .topLeading){
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(.white)
                                        .background(
                                            .ultraThinMaterial,
                                            in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                                         )
                                        .opacity(0.2)
                                        .frame(width: 250, height: 160)
                                    Text("Description")
                                        .bold()
                                        .padding()
                                    
                                    Text(currentSong?.notes ?? "None") // have to check that this wont go out of the white
                                        .padding()
                                        .offset(y: 20)
                                }
                            } // notes box
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
                                        Text("Tempo")
                                            .bold()
                                            .padding()
                                        
                                        Text("\(currentSong?.tempo ?? 0, specifier: "%.0f") BPM")
                                            .padding()
                                            .offset(y: 20)
                                    }
                                } // tempo box
                            }
                            VStack (spacing: 20){
                                VStack{
                                    ZStack(alignment: .topLeading){
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(.white)
                                            .background(
                                                .ultraThinMaterial,
                                                in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                                             )
                                            .opacity(0.2)
                                            .frame(width: 150, height: 70)
                                        Text("Genre")
                                            .bold()
                                            .padding()
                                        
                                        Text(currentSong?.genre ?? "Unknown ⚠️")
                                            .padding()
                                            .offset(y: 20)
                                    }
                                } // genre box
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
                                        Text("Key")
                                            .bold()
                                            .padding()
                                        
                                        Text(currentSong?.key ?? "Unknown ⚠️")
                                            .padding()
                                            .offset(y: 20)
                                    }
                                } // key box
                            }
                        } // end of bottom horizontal
                        
                        // button for deleting folder with alerts
                        Button(action: {
                            confirmDelete = true
                                }) {
                            Text("Delete Folder").foregroundColor(.red).frame(width: 120, height: 30)
                            }
                            .alert(isPresented: $confirmDelete) {
                            Alert(
                                title: Text("Are you sure you want to delete this folder?"),
                                message: Text("This action cannot be undone."),
                                primaryButton: .destructive(Text("Yes")) {
                                    removeItem()
                                    },
                                    secondaryButton: .cancel(Text("No"))
                                )
                            }
                        
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

