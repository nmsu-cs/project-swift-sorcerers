//
//  songView.swift
//  ChordCraft
//
//  Created by Shokhina Jalilova on 4/20/24.
//


// actual variables
// for rating, we should have 5 images?

import SwiftUI

struct songView: View {
    @Binding var showingSongView: Bool
   // @Environment(\.colorScheme) var colorScheme
    //var currentSong: song
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
                                    
                                    Text("Name of song")
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
                                    
                                    Text("Completed")
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
                                    
                                    Text("*****")
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
                                    
                                    Text("This track is ...") // have to check that this wont go out of the white
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
                                        
                                        Text("4-20-24")
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
                                        
                                        Text("165 BPM")
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
                                        
                                        Text("I don't know")
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
                                        
                                        Text("F# Minor")
                                            .padding()
                                            .offset(y: 20)
                                    }
                                } // key box
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
        let sampleSong = song(title: "Good Morning", filePath: "asdfasdf", tempo: 120, genre: "Rap", key: "Fm", starRating: 3, notes: "None", sta: "Completed")
        
        songView(showingSongView: .constant(true))
            .frame(width: 700, height: 400)
    }
}

