//
//  Country.swift
//  VanCountries
//
//  Created by Hoff Henry Pereira da Silva on 16/07/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import Foundation

class Country: Codable {
    
    
     var name : String?
     var topLevelDomain : [String]?
     var alpha2Code : String?
     var alpha3Code : String?
     var callingCodes : [String]?
     var capital : String
     var altSpellings : [String]?
     var region : String?
     var subregion : String?
     var population : Double
     var latitude  : Double?
     var demonym : String?
     var area : Double
     var gini : Double
     var timezones : [String]?
     var borders : [String]?
     var nativeName : String?
     var numericCode : Int?
     var currencies : [Currency]?
     var languages : [Laguage]?
     var translations : Translation?
     var flag : String?
     var regionalBlocs : [RegionalBloc]
     var otherNames : [String]?
     var cioc : String?
 
    
    
}
