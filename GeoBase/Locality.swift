//
//  Locality.swift
//  GeoBase
//
//  Created by Matt Wynyard on 19/05/15.
//  Copyright (c) 2015 Niobium. All rights reserved.
//

import Foundation
import CoreData

@objc(Locality)
class Locality: NSManagedObject {

    @NSManaged var latitude: NSNumber
    @NSManaged var longitude: NSNumber
    @NSManaged var date: NSDate
    @NSManaged var field_id: String
    @NSManaged var notes: String
    @NSManaged var project: Project
    @NSManaged var data: NSSet

}
