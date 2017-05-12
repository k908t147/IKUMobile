//
//  Courses+CoreDataProperties.swift
//  IKUMobile
//
//  Created by Keshawn Triplett on 4/18/17.
//  Copyright © 2017 Keshawn Triplett. All rights reserved.
// Written By: Keshawn Triplett


import Foundation
import CoreData


extension Courses {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Courses> {
        return NSFetchRequest<Courses>(entityName: "Courses")
    }

    @NSManaged public var courseName: String?
    @NSManaged public var labLocation: String?
    @NSManaged public var labStart: String?
    @NSManaged public var labEnd: String?
    @NSManaged public var labDays: NSData?
    @NSManaged public var lecEnd: String?
    @NSManaged public var lecDays: NSData?
    @NSManaged public var lecStart: String?
    @NSManaged public var labInstructor: String?
    @NSManaged public var offDays: NSData?
    @NSManaged public var lecInstructor: String?
    @NSManaged public var lecLocation: String?
    @NSManaged public var offLocation: String?
    @NSManaged public var offEnd: String?
    @NSManaged public var offStart: String?

}
