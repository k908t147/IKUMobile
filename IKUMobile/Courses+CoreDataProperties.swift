//
//  Courses+CoreDataProperties.swift
//  IKUMobile
//
//  Created by Keshawn Triplett on 3/29/17.
//  Copyright © 2017 Keshawn Triplett. All rights reserved.
//

import Foundation
import CoreData


extension Courses {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Courses> {
        return NSFetchRequest<Courses>(entityName: "Courses")
    }

    @NSManaged public var courseName: String?
    @NSManaged public var labInstructor: String?
    @NSManaged public var labLocation: String?
    @NSManaged public var lectureInstructor: String?
    @NSManaged public var lecturLocation: String?
    @NSManaged public var officeLocation: String?
    @NSManaged public var labDays: NSData?
    @NSManaged public var lectureDays: NSData?
    @NSManaged public var officeDays: NSData?
    @NSManaged public var lectureStart: NSDate?
    @NSManaged public var lectureEnd: NSDate?
    @NSManaged public var officeStart: NSDate?
    @NSManaged public var officeEnd: NSDate?
    @NSManaged public var labStart: NSDate?
    @NSManaged public var labEnd: NSDate?

}
