//
//  Assignment+CoreDataProperties.swift
//  IKUMobile
//
//  Created by Keshawn Triplett on 4/18/17.
//  Copyright © 2017 Keshawn Triplett. All rights reserved.
//  Written By: Keshawn Triplett


import Foundation
import CoreData


extension Assignment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Assignment> {
        return NSFetchRequest<Assignment>(entityName: "Assignment")
    }

    @NSManaged public var title: String?
    @NSManaged public var dueDate: String?
    @NSManaged public var dueTime: String?
    @NSManaged public var courseName: String?

}
