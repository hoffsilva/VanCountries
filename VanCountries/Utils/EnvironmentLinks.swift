//
//  EnvironmentLinks.swift
//  VanCountries
//
//  Created by Hoff Henry Pereira da Silva on 17/07/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import Foundation

// MARK: - Enviroment Links Singleton -
class EnvironmentLinks {
    
    // MARK: - Properties -
    
    static let shared = EnvironmentLinks()
    
    var current : EnvironmentBase?
    
}

// MARK: - Environment Base Enum -
enum EnvironmentBase: String {
    case restcountries
}

// MARK: - Request Link Enum -
enum RequestLinks: String {
    
    case getAllCountries
    
}
