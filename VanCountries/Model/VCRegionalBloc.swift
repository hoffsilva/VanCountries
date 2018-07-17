//
//  RegionalBloc.swift
//  VanCountries
//
//  Created by Hoff Henry Pereira da Silva on 17/07/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import Foundation

class VCRegionalBloc: Codable {
    
    let acronym: String?
    let name: String?
    let otherAcronyms: [JSONAny]?
    let otherNames: [JSONAny]?
    
    init(acronym: String?, name: String?, otherAcronyms: [JSONAny]?, otherNames: [JSONAny]?) {
        self.acronym = acronym
        self.name = name
        self.otherAcronyms = otherAcronyms
        self.otherNames = otherNames
    }
    
}
