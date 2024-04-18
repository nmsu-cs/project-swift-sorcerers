//
//  Item.swift
//  ChordCraft
//
// database setup with simple component

import Foundation
import SwiftData

@Model
final class Item {
    // properties of item
    var name: String
    var genre: String
    var day: String

    // contructor for item
    init(n: String, g: String) {
        self.name = n
        self.genre = g
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // Define the date format you want
        let currentDate = Date()
        let dateString = dateFormatter.string(from: currentDate)
        self.day = dateString
    }
}
