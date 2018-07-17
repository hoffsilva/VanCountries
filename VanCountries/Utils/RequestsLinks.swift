//
//  RequestsLinks.swift
//  VanCountries
//
//  Created by Hoff Henry Pereira da Silva on 17/07/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import Foundation

// MARK: - Enviroment Links Singleton -
class RequestLinks {
    
    // MARK: - Properties -
    
    static let shared = RequestLinks()
    
    var current : RequestLinksBase?
    
}

// MARK: - Request Link Enum -
enum RequestLinksBase: String {
    
    case getAllCountries
    
}
