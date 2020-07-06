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
