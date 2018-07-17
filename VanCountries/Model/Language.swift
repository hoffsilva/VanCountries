//
//  File.swift
//  VanCountries
//
//  Created by Hoff Henry Pereira da Silva on 17/07/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import Foundation

class Language: Codable {
    let iso6391, iso6392, name, nativeName: String?
    
    enum CodingKeys: String, CodingKey {
        case iso6391 = "iso639_1"
        case iso6392 = "iso639_2"
        case name, nativeName
    }
    
    init(iso6391: String?, iso6392: String?, name: String?, nativeName: String?) {
        self.iso6391 = iso6391
        self.iso6392 = iso6392
        self.name = name
        self.nativeName = nativeName
    }
}
