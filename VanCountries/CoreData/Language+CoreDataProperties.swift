//
//  Language+CoreDataProperties.swift
//  VanCountries
//
//  Created by Hoff Henry Pereira da Silva on 16/07/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//
//

import Foundation
import CoreData


extension Language {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Language> {
        return NSFetchRequest<Language>(entityName: "Language")
    }

    @NSManaged public var iso639_1: String?
    @NSManaged public var iso639_2: String?
    @NSManaged public var name: String?
    @NSManaged public var nativeName: String?
    @NSManaged public var relationship: Country?

}
