//
//  Planet.swift
//  Astronomy
//
//  Created by FGT MAC on 5/27/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import Foundation

class Planet: NSObject, Decodable {
    
    enum CodingKeys: String, CodingKey {
        case name
        case photo = "img_src"
        case date = "earth_date"
        case cameraName = "full_name"
        //First level
        case photos
        //second level
        case rover
        //THird level
        case cameras = "camera"
    }
    
    
    let name: String
    let photo: URL
    let date: Date
    let cameraName: String
    
//    init(name: String, photo: URL, date: Date, camera: String) {
//        self.name = name
//        self.photo = photo
//        self.date = date
//        self.camera = camera
//    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        //First level
        let  photos =  try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .photos)
        //second level
        let rover = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .rover)
        //Third level
        let cameras = try rover.nestedContainer(keyedBy: CodingKeys.self, forKey: .cameras)
        
        //Extract properties
        self.name = try rover.decode(String.self, forKey: .name)
        self.photo = try photos.decode(URL.self, forKey: .photo)
        self.date = try container.decode(Date.self, forKey: .date)
        self.cameraName = try cameras.decode(String.self, forKey: .cameraName)
        
    }
}
