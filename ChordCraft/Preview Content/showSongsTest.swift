//
//  showSongsTest.swift
//  ChordCraft
//
//  Created by Daniel Moreno on 4/23/24.
//

import SwiftUI
import SwiftData

struct showSongsTest: View {
    
    @Environment(\.modelContext) public var modelContext
    @Query private var songs: [song] // where songs are stored
    
    var body: some View {
        
        VStack {
            Text("Click button to add song")
            
        // The button was not calling the function correctly.
            // need to pass the call as an "action" parameter, the other stuff is the styling
            Button(action: { addSong()}) {
                Text("add")
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            // did not need the forloop sorry,
            List(songs) { item in  // this turns the array into a list and the vstack displays them vertically.
                VStack() {
                    Text(item.title)
            // uncoment to display the other properties
                  //  Text("Genre: \(item.genre)")
                  //  Text("date: \(item.dateCreated)")
                  //  Text("tempo: \(item.tempo)")
                  //  Text("rating: \(item.starRating)")
                  //  Text("key: \(item.key)")
                  //  Text("notes: \(item.notes)")
                  //  Text("Path to file: \(item.filePath)")
                  //  Text("Stage of production: \(item.stage)")

                        .foregroundColor(.gray)
                }
                
            }
        }       
        .buttonStyle(PlainButtonStyle()) // makes button look nice?

    }
        
        
        func addSong() {
            let song = song(title: "song12", filePath: "dssdfg", tempo: 23, genre: "rap", key: "f", starRating: 3, notes: "none", sta: "All")
            modelContext.insert(song)
        
        
    }
}



#Preview {
    showSongsTest()
}
