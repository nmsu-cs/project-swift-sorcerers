//
//  songModel.swift
//  ChordCraft
//
//
//  Created by Daniel Moreno on 4/4/24.
//

import Foundation
import SwiftData

@Model
class song {
    var title: String
    var filePath: String
    var dateCreated: String
    var tempo: Double
    var genre: String
    var key: String
    var starRating: Double
    var notes: String
    
    init(title: String, filePath: String, tempo: Double, genre: String, key: String, starRating: Double, notes: String) {
        self.title = title
        self.filePath = filePath
        // get the date of the system when init is called and set that to the date created of the song
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // Define the date format you want
        let currentDate = Date()
        let dateString = dateFormatter.string(from: currentDate)
        
        self.dateCreated = dateString
        self.tempo = tempo
        self.genre = genre
        self.key = key
        self.starRating = starRating
        self.notes = notes
    }
    
    // update functions
    func updateTitle(newTitle: String) {
        self.title = newTitle
    }
    
    func updateFilePath(newFilePath: String) {
        self.filePath = newFilePath
    }
    
    //  func updateDateCreated(newDateCreated: Date) {
    //    self.dateCreated = newDateCreated
    // }
    
    func updateTempo(newTempo: Double) {
        self.tempo = newTempo
    }
    
    func updateGenre(newGenre: String) {
        self.genre = newGenre
    }
    
    func updateKey(newKey: String) {
        self.key = newKey
    }
    
    func updateStarRating(newStarRating: Double) {
        self.starRating = newStarRating
    }
    
    func updateNotes(newNotes: String) {
        self.notes = newNotes
    }
}
