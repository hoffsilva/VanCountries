//
//  RegionalBloc+CoreDataProperties.swift
//  VanCountries
//
//  Created by Hoff Henry Pereira da Silva on 16/07/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//
//

import Foundation
import CoreData


extension RegionalBloc {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RegionalBloc> {
        return NSFetchRequest<RegionalBloc>(entityName: "RegionalBloc")
    }

    @NSManaged public var acronym: String?
    @NSManaged public var name: String?
    @NSManaged public var otherAcronyms: NSObject?
    @NSManaged public var otherNames: NSObject?
    @NSManaged public var relationship: Country?

}
