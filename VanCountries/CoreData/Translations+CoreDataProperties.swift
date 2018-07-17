//
//  Translations+CoreDataProperties.swift
//  VanCountries
//
//  Created by Hoff Henry Pereira da Silva on 16/07/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//
//

import Foundation
import CoreData


extension Translations {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Translations> {
        return NSFetchRequest<Translations>(entityName: "Translations")
    }

    @NSManaged public var de: String?
    @NSManaged public var es: String?
    @NSManaged public var fr: String?
    @NSManaged public var ja: String?
    @NSManaged public var it: String?
    @NSManaged public var br: String?
    @NSManaged public var pt: String?
    @NSManaged public var nl: String?
    @NSManaged public var hr: String?
    @NSManaged public var fa: String?
    @NSManaged public var relationship: Country?

}
