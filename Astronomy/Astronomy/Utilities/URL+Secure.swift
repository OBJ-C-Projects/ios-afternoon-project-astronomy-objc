//
//  URL+Secure.swift
//  Astronomy
//
//  Created by FGT MAC on 5/31/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import Foundation

extension URL {
    var usingHTTPS: URL? {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: true) else { return nil }
        components.scheme = "https"
        return components.url
    }
}
