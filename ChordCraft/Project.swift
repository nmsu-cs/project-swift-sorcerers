//
//  Project.swift
//  ChordCraft
//
//  Created by Shokhina Jalilova on 4/4/24.
//

import Foundation
import SwiftData

@Model
class Project {
    
    // created by?
    // duration?
    var projectName: String
    var dateCreated: String
    //var songs = Song(backingData: any BackingData<Song>)
    //var songs = [Song]()
    //var songs: [Song] = [Song]()
    var songs: [song]
    
    init(projectName: String) {
        self.projectName = projectName
        // get the date of the system when init is called and set that to the date created of the song
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // Define the date format you want
        let currentDate = Date()
        let dateString = dateFormatter.string(from: currentDate)
        
        self.dateCreated = dateString
        self.songs = []
    }
    
    // setters
    func setProjectName(projectName: String) -> Void {
        self.projectName = projectName
    }
    func setDateCreated(dateCreated: String) -> Void { // dont know if we will use it
        self.dateCreated = dateCreated
    }
    
    func addSongs(song: song) -> Void {
        songs.append(song)
    }
    
    // getters
    func getProjectName() -> String{
        return projectName
    }
    func getDateCreated() -> String{
        return dateCreated
    }
    
}
