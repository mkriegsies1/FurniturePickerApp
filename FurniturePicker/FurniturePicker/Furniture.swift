//
//  Furniture.swift
//  FurniturePicker
//
//  Created by John Haney (Maryville) on 9/12/18.
//  Copyright © 2018 John Haney (Maryville). All rights reserved.
//

import UIKit

class Furniture {
    var name: String
    var image: UIImage?
    
    init(name: String, image: UIImage? = nil) {
        self.name = name
        self.image = image
    }
}

protocol FurnitureContaining: class {
    var furniture: Furniture? { get set }
}
