//
//  CoreDataManager.swift
//  Memini
//
//  Created by Jessica Trinh on 7/10/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    
    static let managedContext: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }

        let persistanceContainer = appDelegate.persistentContainer
        let context = persistanceContainer.viewContext
        return context
    }()
    
    class func deleteItem(item: NSManagedObject, _ project: Project? = nil, _ completed: Bool = false) {
        var copy: NSMutableOrderedSet = NSMutableOrderedSet()
        
        if project != nil {
            if completed {
                copy = project?.completedTasks!.mutableCopy() as! NSMutableOrderedSet
                copy.remove(item)
                project?.completedTasks = copy
            } else {
                copy = project?.tasks!.mutableCopy() as! NSMutableOrderedSet
                copy.remove(item)
                project?.tasks = copy
            }
    
        } else {
            managedContext.delete(item)
        }
        saveItem()
    }
    
    class func saveItem() {
        do {
            try managedContext.save()
        } catch let error{
            print("Unable to save \(error.localizedDescription)")
        }
    }
}
