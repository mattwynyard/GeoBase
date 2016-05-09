//
//  Project.swift
//  GeoBase
//
//  Created by Matt Wynyard on 10/05/15.
//  Copyright (c) 2015 Niobium. All rights reserved.
//

import Foundation
import CoreData

@objc(Project)
class Project: NSManagedObject {

    @NSManaged var project: String
    @NSManaged var date_created: String
    @NSManaged var notes: String

}
