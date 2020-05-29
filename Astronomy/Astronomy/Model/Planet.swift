//
//  Planet.swift
//  Astronomy
//
//  Created by FGT MAC on 5/27/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import Foundation

class Planet: NSObject, Decodable {

    @objc let name: String
    @objc let photo: URL
    @objc let date: Date
    @objc let cameraName: String
    
    
    @objc init( name: String, photo: URL, date: Date, cameraName: String) {
        self.name = name
        self.photo = photo
        self.date = date
        self.cameraName = cameraName
    }
    
    
    @objc convenience init?(dictionary: [String:Any]) {
        guard let name = dictionary["name"] as? String,
            let photo = dictionary["photo"] as? URL,
            let date = dictionary["date"] as? Date,
            let cameraName = dictionary["cameraName"] as? String else {
                return nil
        }
        self.init(name:name,photo:photo,date:date,cameraName:cameraName)
    }
}
