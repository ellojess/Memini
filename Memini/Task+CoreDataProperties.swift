//
//  Task+CoreDataProperties.swift
//  Memini
//
//  Created by Jessica Trinh on 7/13/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var belongsToAProject: Bool
    @NSManaged public var dueDate: String?
    @NSManaged public var status: Bool
    @NSManaged public var title: String?
    @NSManaged public var project: Project?

}
