//
//  College+CoreDataProperties.swift
//  DataBase_Practice
//
//  Created by OBMac-13 on 13/03/26.
//
//

import Foundation
import CoreData


extension College {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<College> {
        return NSFetchRequest<College>(entityName: "College")
    }

    @NSManaged public var name: String?
    @NSManaged public var university: String?
    @NSManaged public var city: String?
    @NSManaged public var address: String?

}

extension College : Identifiable {

}
