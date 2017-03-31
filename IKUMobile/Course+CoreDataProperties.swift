//
//  Course+CoreDataProperties.swift
//  IKUMobile
//
//  Created by Keshawn Triplett on 3/29/17.
//  Copyright © 2017 Keshawn Triplett. All rights reserved.
//

import Foundation
import CoreData


extension Course {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Course> {
        return NSFetchRequest<Course>(entityName: "Course")
    }

    @NSManaged public var courseName: String?
    @NSManaged public var labInstructor: String?
    @NSManaged public var labLocation: String?

}
