//
//  Currency+CoreDataProperties.swift
//  VanCountries
//
//  Created by Hoff Henry Pereira da Silva on 18/07/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//
//

import Foundation
import CoreData


extension Currency {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Currency> {
        return NSFetchRequest<Currency>(entityName: "Currency")
    }

    @NSManaged public var code: String?
    @NSManaged public var name: String?
    @NSManaged public var symbol: String?
    @NSManaged public var relationship: Country?

}
