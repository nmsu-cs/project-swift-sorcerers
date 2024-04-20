//
//  songView2.swift
//  ChordCraft
//
//  Created by Shokhina Jalilova on 4/20/24.
//


// actual variables
// for rating, we should have 5 images?

import SwiftUI

struct songView2: View {
    var body: some View {
        ScrollView {
            Spacer()
            Spacer()
            Spacer()
            ZStack {
                VStack(spacing: 20){
                    HStack(spacing: 20){
                        Image("SongFolder")
                            .resizable()
                            .frame(width: 80, height: 75)
                        VStack{
                            ZStack(alignment: .topLeading)
                            {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.white)
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
            }
        }
       
        .frame(minWidth: 600, minHeight: 250)
        
    }
}

struct songView2_Previews: PreviewProvider {
    static var previews: some View {
        songView2()
    }
}

