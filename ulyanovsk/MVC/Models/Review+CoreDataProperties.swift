//
//  Review+CoreDataProperties.swift
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

extension Review {

    @NSManaged var name: String?
    @NSManaged var text: String?
    @NSManaged var date: NSDate?
    @NSManaged var place: Place?

}
