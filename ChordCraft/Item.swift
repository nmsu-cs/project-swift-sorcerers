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
    var name :String
    var genre: String
    
    // contructor for item
    init(n: String,g:String) {
        self.name = n
        self.genre = g
    }
}
