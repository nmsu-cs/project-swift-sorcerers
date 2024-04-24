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
            Button("Add a song") {
                addSong()
            }
            
            List {
                ForEach(songs) { song in
                    Text(song.title)
                }
            }
        }
    }
        
        
        func addSong() {
            let song = song(title: "song12", filePath: "dssdfg", tempo: 23, genre: "rap", key: "f", starRating: 3, notes: "none", sta: "All")
            modelContext.insert(song)
        
        
    }
}



#Preview {
    showSongsTest()
}
