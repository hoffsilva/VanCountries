//
//  Country.swift
//  VanCountries
//
//  Created by Hoff Henry Pereira da Silva on 16/07/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import Foundation
// To parse the JSON, add this file to your project and do:
//
//   let country = try? JSONDecoder().decode(Country.self, from: jsonData)

import Foundation

class VCCountry: Codable {
    
    let name: String?
    let topLevelDomain: [String]?
    let alpha2Code, alpha3Code: String?
    let callingCodes: [String]?
    let capital: String?
    let altSpellings: [String]?
    let region, subregion: String?
    let population: Int?
    let latlng: [Double]?
    let demonym: String?
    let area: Double?
    let gini: Double?
    let timezones: [String]?
    let borders: [String]?
    let nativeName: String?
    let numericCode: String?
    let currencies: [VCCurrency]?
    let languages: [VCLanguage]?
    let translations: VCTranslation?
    let flag: String?
    let regionalBlocs: [VCRegionalBloc]?
    let cioc: String?
    
    init(
        name: String?,
        topLevelDomain: [String]?,
        alpha2Code: String?,
        alpha3Code: String?,
        callingCodes: [String]?,
        capital: String?,
        altSpellings: [String]?,
        region: String?,
        subregion: String?,
        population: Int?,
        latlng: [Double]?,
        demonym: String?,
        area: Double?,
        gini: Double?,
        timezones: [String]?,
        borders: [String]?,
        nativeName: String?,
        numericCode: String?,
        currencies: [VCCurrency]?,
        languages: [VCLanguage]?,
        translations: VCTranslation?,
        flag: String?,
        regionalBlocs: [VCRegionalBloc]?,
        cioc: String?) {
        
        self.name = name
        self.topLevelDomain = topLevelDomain
        self.alpha2Code = alpha2Code
        self.alpha3Code = alpha3Code
        self.callingCodes = callingCodes
        self.capital = capital
        self.altSpellings = altSpellings
        self.region = region
        self.subregion = subregion
        self.population = population
        self.latlng = latlng
        self.demonym = demonym
        self.area = area
        self.gini = gini
        self.timezones = timezones
        self.borders = borders
        self.nativeName = nativeName
        self.numericCode = numericCode
        self.currencies = currencies
        self.languages = languages
        self.translations = translations
        self.flag = flag
        self.regionalBlocs = regionalBlocs
        self.cioc = cioc
    }
}


