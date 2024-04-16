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
    //var songs = Song(backingData: <#any BackingData<Song>#>)
    //var songs = [Song]()
    //var songs: [Song] = [Song]()
    var songs: [Song]
    
    init(projectName: String, dateCreated: String) {
        self.projectName = projectName
        self.dateCreated = dateCreated
        self.songs = []
    }
    
    // setters
    func setProjectName(projectName: String) -> Void {
        self.projectName = projectName
    }
    func setDateCreated(dateCreated: String) -> Void { // dont know if we will use it
        self.dateCreated = dateCreated
    }
    
    func addSongs(song: Song) -> Void {
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
