//
//  CompletedTask+CoreDataProperties.swift
//  Memini
//
//  Created by Jessica Trinh on 7/16/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//
//

import Foundation
import CoreData


extension CompletedTask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CompletedTask> {
        return NSFetchRequest<CompletedTask>(entityName: "CompletedTask")
    }

    @NSManaged public var belongsToAProject: Bool
    @NSManaged public var dueDate: String?
    @NSManaged public var status: Bool
    @NSManaged public var title: String?
    @NSManaged public var project: Project?

}
