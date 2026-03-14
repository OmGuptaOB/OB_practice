//
//  Users+CoreDataProperties.swift
//  DataBase_Practice
//
//  Created by OBMac-13 on 13/03/26.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var age: String?
    @NSManaged public var password: String?
    @NSManaged public var username: String?

}

extension Users : Identifiable {

}
