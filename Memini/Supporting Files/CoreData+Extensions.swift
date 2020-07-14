//
//  CoreData+Extensions.swift
//  Memini
//
//  Created by Jessica Trinh on 7/6/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension HomeViewController {
    
    func save(name: String, hasManyTasks: Bool, color: String){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Project", in: managedContext)!
        let project = NSManagedObject(entity: entity, insertInto: managedContext)
        project.setValue(name, forKey: "name")
        project.setValue(hasManyTasks, forKey: "hasManyTasks")
        project.setValue(color, forKey: "color")
        do {
            try managedContext.save()
            projects.append(project)
        } catch let error as NSError{
            print(error)
        }
    }
    
    
    
}

extension ToDoListViewController {
    
    func add(belongsToAProject: Bool, dueDate: String, status: Bool, title: String) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Task", in: managedContext)!
//        let task = Task(context: managedContext)
        let task = NSManagedObject(entity: entity, insertInto: managedContext)

        let project = Project(context: managedContext)
//        task.belongsToAProject = belongsToAProject
//        task.dueDate = dueDate
//        task.status = status
//        task.title = title
        
        task.setValue(title, forKey: "title")
        task.setValue(status, forKey: "status")
        task.setValue(dueDate, forKey: "dueDate")
        task.setValue(belongsToAProject, forKey: "belongsToAProject")

        
    
        let tasks = project.mutableSetValue(forKey: #keyPath(Project.tasks))
        tasks.add(task)
//        project.tasks = tasks
        
        
        do {
            try managedContext.save()
//            task.append(task)
        } catch let error as NSError{
            print(error)
        }
        
    }
    
}
