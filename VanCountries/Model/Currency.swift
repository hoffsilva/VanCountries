//
//  Currency.swift
//  VanCountries
//
//  Created by Hoff Henry Pereira da Silva on 17/07/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import Foundation

class Currency: Codable {
    let code, name, symbol: String?
    
    init(code: String?, name: String?, symbol: String?) {
        self.code = code
        self.name = name
        self.symbol = symbol
    }
}
