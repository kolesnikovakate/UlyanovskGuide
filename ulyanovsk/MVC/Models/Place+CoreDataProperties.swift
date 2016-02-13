//
//  Place+CoreDataProperties.swift
//  ulyanovsk
//
//  Created by Ekaterina Kolesnikova on 25.01.16.
//  Copyright © 2016 Ekaterina Kolesnikova. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Place {

    @NSManaged var lat: NSNumber?
    @NSManaged var lon: NSNumber?
    @NSManaged var title: String?
    @NSManaged var info: String?
    @NSManaged var image: String?
    @NSManaged var rating: NSNumber?
    @NSManaged var reviews: NSSet?

}
