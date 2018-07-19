//
//  Country+CoreDataProperties.swift
//  VanCountries
//
//  Created by Hoff Henry Pereira da Silva on 18/07/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//
//

import Foundation
import CoreData


extension Country {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Country> {
        return NSFetchRequest<Country>(entityName: "Country")
    }

    @NSManaged public var alpha2Code: String?
    @NSManaged public var alpha3Code: String?
    @NSManaged public var altSpellings: NSObject?
    @NSManaged public var area: Double
    @NSManaged public var borders: NSObject?
    @NSManaged public var callingCodes: NSObject?
    @NSManaged public var capital: String?
    @NSManaged public var cioc: String?
    @NSManaged public var demonym: String?
    @NSManaged public var flag: String?
    @NSManaged public var gini: Double
    @NSManaged public var latitude: Double
    @NSManaged public var logitude: Double
    @NSManaged public var name: String?
    @NSManaged public var nativeName: String?
    @NSManaged public var numericCode: String?
    @NSManaged public var population: Double
    @NSManaged public var region: String?
    @NSManaged public var subregion: String?
    @NSManaged public var timezones: NSObject?
    @NSManaged public var topLevelDomain: NSObject?
    @NSManaged public var currency: NSSet?
    @NSManaged public var language: NSSet?
    @NSManaged public var relationship2: NSSet?

}

// MARK: Generated accessors for currency
extension Country {

    @objc(addCurrencyObject:)
    @NSManaged public func addToCurrency(_ value: Currency)

    @objc(removeCurrencyObject:)
    @NSManaged public func removeFromCurrency(_ value: Currency)

    @objc(addCurrency:)
    @NSManaged public func addToCurrency(_ values: NSSet)

    @objc(removeCurrency:)
    @NSManaged public func removeFromCurrency(_ values: NSSet)

}

// MARK: Generated accessors for language
extension Country {

    @objc(addLanguageObject:)
    @NSManaged public func addToLanguage(_ value: Language)

    @objc(removeLanguageObject:)
    @NSManaged public func removeFromLanguage(_ value: Language)

    @objc(addLanguage:)
    @NSManaged public func addToLanguage(_ values: NSSet)

    @objc(removeLanguage:)
    @NSManaged public func removeFromLanguage(_ values: NSSet)

}

// MARK: Generated accessors for relationship2
extension Country {

    @objc(addRelationship2Object:)
    @NSManaged public func addToRelationship2(_ value: Translations)

    @objc(removeRelationship2Object:)
    @NSManaged public func removeFromRelationship2(_ value: Translations)

    @objc(addRelationship2:)
    @NSManaged public func addToRelationship2(_ values: NSSet)

    @objc(removeRelationship2:)
    @NSManaged public func removeFromRelationship2(_ values: NSSet)

}
