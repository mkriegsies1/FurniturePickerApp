//
//  Room.swift
//  FurniturePicker
//
//  Created by John Haney (Maryville) on 9/12/18.
//  Copyright © 2018 John Haney (Maryville). All rights reserved.
//

import Foundation

class Room {
    var name: String
    var furniture: [Furniture] = []
    
    init(name: String, furniture: [Furniture]) {
        self.name = name
        self.furniture = furniture
    }
}

protocol RoomContaining: class {
    var room: Room? { get set }
}
