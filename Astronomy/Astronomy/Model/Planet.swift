//
//  Planet.swift
//  Astronomy
//
//  Created by FGT MAC on 5/27/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import Foundation

class Planet: NSObject {
    var name: String
    var photo: URL
    var date: Date
    var camera: String
    
    init(name: String, photo: URL, date: Date, camera: String) {
        self.name = name
        self.photo = photo
        self.date = date
        self.camera = camera
    }
}
