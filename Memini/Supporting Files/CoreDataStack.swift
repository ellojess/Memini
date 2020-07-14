//
//  CoreDataStack.swift
//  Memini
//
//  Created by Jessica Trinh on 7/13/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import Foundation
import CoreData //import the core data module

class CoreDataStack {

  private let modelName: String //create a private property to store the modelName

  //we always need this
  lazy var managedContext: NSManagedObjectContext = {
    return self.storeContainer.viewContext
  }()

  init(modelName: String) {
    self.modelName = modelName //initializer needed to save the modelName into the private property
  }

  //lazy instantiate the NSPersistentContainer, passing the modelName
  private lazy var storeContainer: NSPersistentContainer = {

    let container = NSPersistentContainer(name: self.modelName)
    container.loadPersistentStores {(storeDescription, error) in
      if let error = error as NSError? {
        print("Error: \(error), \(error.userInfo)")
      }
    }
    return container
  }()
    
    func saveContext () {
      guard managedContext.hasChanges else { return }

      do {
        try managedContext.save()
      } catch let error as NSError {
        print("Error: \(error), \(error.userInfo)")
      }
    }
    
    func fetchPersistentData(completion: @escaping(Result<[Project]>) -> Void) {
        let fetchRequest: NSFetchRequest<Project> = Project.fetchRequest()
        
        do {
            let allProduces = try managedContext.fetch(fetchRequest)
            completion(.success(allProduces))
        } catch {
            completion(.failure(error))
        }
    }
    
    func fetchTasks(with request: NSFetchRequest<Task> = Task.fetchRequest(), predicate: NSPredicate? = nil, selectedProject: String, completion: @escaping(Result<[Task]>) -> Void) {
        
        let projectPredicate = NSPredicate(format: "project.name == %@", selectedProject)
        
        if let addtionalPredicate = predicate {
            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [projectPredicate, addtionalPredicate])
        } else {
            request.predicate = projectPredicate
        }
        do {
            let tasks = try managedContext.fetch(request)
            completion(.success(tasks))
        } catch {
            completion(.failure(error))
        }
        
        
    }
}

enum Result<T> {
    case success(T)
    case failure(Error)
}

