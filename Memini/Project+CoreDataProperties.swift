//
//  Project+CoreDataProperties.swift
//  Memini
//
//  Created by Jessica Trinh on 7/16/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//
//

import Foundation
import CoreData


extension Project {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Project> {
        return NSFetchRequest<Project>(entityName: "Project")
    }

    @NSManaged public var color: String?
    @NSManaged public var hasManyTasks: Bool
    @NSManaged public var name: String?
    @NSManaged public var completedTasks: NSOrderedSet?
    @NSManaged public var tasks: NSOrderedSet?

}

// MARK: Generated accessors for completedTasks
extension Project {

    @objc(insertObject:inCompletedTasksAtIndex:)
    @NSManaged public func insertIntoCompletedTasks(_ value: CompletedTask, at idx: Int)

    @objc(removeObjectFromCompletedTasksAtIndex:)
    @NSManaged public func removeFromCompletedTasks(at idx: Int)

    @objc(insertCompletedTasks:atIndexes:)
    @NSManaged public func insertIntoCompletedTasks(_ values: [CompletedTask], at indexes: NSIndexSet)

    @objc(removeCompletedTasksAtIndexes:)
    @NSManaged public func removeFromCompletedTasks(at indexes: NSIndexSet)

    @objc(replaceObjectInCompletedTasksAtIndex:withObject:)
    @NSManaged public func replaceCompletedTasks(at idx: Int, with value: CompletedTask)

    @objc(replaceCompletedTasksAtIndexes:withCompletedTasks:)
    @NSManaged public func replaceCompletedTasks(at indexes: NSIndexSet, with values: [CompletedTask])

    @objc(addCompletedTasksObject:)
    @NSManaged public func addToCompletedTasks(_ value: CompletedTask)

    @objc(removeCompletedTasksObject:)
    @NSManaged public func removeFromCompletedTasks(_ value: CompletedTask)

    @objc(addCompletedTasks:)
    @NSManaged public func addToCompletedTasks(_ values: NSOrderedSet)

    @objc(removeCompletedTasks:)
    @NSManaged public func removeFromCompletedTasks(_ values: NSOrderedSet)

}

// MARK: Generated accessors for tasks
extension Project {

    @objc(insertObject:inTasksAtIndex:)
    @NSManaged public func insertIntoTasks(_ value: Task, at idx: Int)

    @objc(removeObjectFromTasksAtIndex:)
    @NSManaged public func removeFromTasks(at idx: Int)

    @objc(insertTasks:atIndexes:)
    @NSManaged public func insertIntoTasks(_ values: [Task], at indexes: NSIndexSet)

    @objc(removeTasksAtIndexes:)
    @NSManaged public func removeFromTasks(at indexes: NSIndexSet)

    @objc(replaceObjectInTasksAtIndex:withObject:)
    @NSManaged public func replaceTasks(at idx: Int, with value: Task)

    @objc(replaceTasksAtIndexes:withTasks:)
    @NSManaged public func replaceTasks(at indexes: NSIndexSet, with values: [Task])

    @objc(addTasksObject:)
    @NSManaged public func addToTasks(_ value: Task)

    @objc(removeTasksObject:)
    @NSManaged public func removeFromTasks(_ value: Task)

    @objc(addTasks:)
    @NSManaged public func addToTasks(_ values: NSOrderedSet)

    @objc(removeTasks:)
    @NSManaged public func removeFromTasks(_ values: NSOrderedSet)

}
