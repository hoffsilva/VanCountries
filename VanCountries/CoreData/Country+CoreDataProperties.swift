//
//  Country+CoreDataProperties.swift
//  VanCountries
//
//  Created by Hoff Henry Pereira da Silva on 16/07/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//
//

import Foundation
import CoreData


extension Country {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Country> {
        return NSFetchRequest<Country>(entityName: "Country")
    }

    @NSManaged public var name: String?
    @NSManaged public var topLevelDomain: NSObject?
    @NSManaged public var alpha2Code: String?
    @NSManaged public var alpha3Code: String?
    @NSManaged public var callingCodes: NSObject?
    @NSManaged public var capital: String?
    @NSManaged public var altSpellings: NSObject?
    @NSManaged public var region: String?
    @NSManaged public var subregion: String?
    @NSManaged public var population: Double
    @NSManaged public var latitude: Double
    @NSManaged public var logitude: Double
    @NSManaged public var demonym: String?
    @NSManaged public var area: Double
    @NSManaged public var gini: Double
    @NSManaged public var timezones: NSObject?
    @NSManaged public var borders: NSObject?
    @NSManaged public var nativeName: String?
    @NSManaged public var numericCode: Int16
    @NSManaged public var flag: String?
    @NSManaged public var regionalBlocs: NSObject?
    @NSManaged public var cioc: String?
    @NSManaged public var relationship: NSSet?
    @NSManaged public var relationship1: NSSet?
    @NSManaged public var relationship2: NSSet?
    @NSManaged public var relationship3: NSSet?

}

// MARK: Generated accessors for relationship
extension Country {

    @objc(addRelationshipObject:)
    @NSManaged public func addToRelationship(_ value: Currency)

    @objc(removeRelationshipObject:)
    @NSManaged public func removeFromRelationship(_ value: Currency)

    @objc(addRelationship:)
    @NSManaged public func addToRelationship(_ values: NSSet)

    @objc(removeRelationship:)
    @NSManaged public func removeFromRelationship(_ values: NSSet)

}

// MARK: Generated accessors for relationship1
extension Country {

    @objc(addRelationship1Object:)
    @NSManaged public func addToRelationship1(_ value: Language)

    @objc(removeRelationship1Object:)
    @NSManaged public func removeFromRelationship1(_ value: Language)

    @objc(addRelationship1:)
    @NSManaged public func addToRelationship1(_ values: NSSet)

    @objc(removeRelationship1:)
    @NSManaged public func removeFromRelationship1(_ values: NSSet)

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

// MARK: Generated accessors for relationship3
extension Country {

    @objc(addRelationship3Object:)
    @NSManaged public func addToRelationship3(_ value: RegionalBloc)

    @objc(removeRelationship3Object:)
    @NSManaged public func removeFromRelationship3(_ value: RegionalBloc)

    @objc(addRelationship3:)
    @NSManaged public func addToRelationship3(_ values: NSSet)

    @objc(removeRelationship3:)
    @NSManaged public func removeFromRelationship3(_ values: NSSet)

}
