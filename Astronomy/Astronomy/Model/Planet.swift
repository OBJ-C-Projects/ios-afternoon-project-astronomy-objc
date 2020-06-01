//
//  Planet.swift
//  Astronomy
//
//  Created by FGT MAC on 5/27/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import Foundation

class Planet: NSObject, Decodable {

    @objc let imageURL: URL
    @objc let date: String
    
    
    @objc init(imageURL: URL, date: String) {
        self.imageURL = imageURL
        self.date = date
    }
    
    
    @objc convenience init?(dictionary: [String:Any]) {
        guard let imageURLString = dictionary["img_src"] as? String,
            let date = dictionary["earth_date"] as? String,
        let imageURL = URL(string: imageURLString) else {
                return nil
        }
        self.init(imageURL:imageURL,date:date)
    }
}
