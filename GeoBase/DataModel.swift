//
//  DataModel.swift
//  GeoBase
//
//  Created by Matt Wynyard on 10/04/15.
//  Copyright (c) 2015 Niobium. All rights reserved.
//

import Foundation
import CoreData

@objc(DataModel)
class DataModel: NSManagedObject {
    
    @NSManaged var date: String
    @NSManaged var dip: Int32
    @NSManaged var direction: String
    @NSManaged var elevation: Double
    @NSManaged var id: String
    @NSManaged var latitude: Double
    @NSManaged var longitude: Double
    @NSManaged var strike: Int32
    @NSManaged var structure: String
    @NSManaged var north: String
    @NSManaged var project: Project
    
   
}
