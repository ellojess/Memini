//
//  ToDoItemsTableCell.swift
//  Memini
//
//  Created by Jessica Trinh on 6/30/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ToDoItemsTableCell: UITableViewCell {
    
    let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = UIFont(name: "AvenirNext-Bold", size: 20)
        label.textColor = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1.0)
        //        label.textAlignment = .center
        label.contentMode = .scaleAspectFit
        return label
    }()
    
    let checkbox: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "unchecked_checkbox"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    var task: Task? = nil {
        didSet {
            if task != nil {
                title.text = task?.title
            }
        }
    }
    
    var completedTask: CompletedTask? = nil {
        didSet {
            if completedTask != nil {
                title.text = completedTask?.title
            }
        }
    }
    
    
    var segment: Int = 0 {
        didSet {
            // determine checkbox image by which segment
            if segment == 1 {
                checkbox.setImage(UIImage(named: "checked_checkbox"), for: .normal)
            } else if segment == 0 {
                checkbox.setImage(UIImage(named: "unchecked_checkbox"), for: .normal)
            }
        }
    }
    
    var project: Project2? {
        didSet {
            title.text = project?.title
        }
    }
    
    var parent: ToDoListViewController!
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCell()
    }
    
    
    // logic to move task from one segment to another segment
    @objc func checkboxTapped(){
        
        UIView.animate(withDuration: 0.3,
                       animations: {
                        self.checkbox.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.3) {
                            self.checkbox.transform = CGAffineTransform.identity
                        }
        })
        
        // Implement persistence for To Do List tasks
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let copy = parent.completedItems.mutableCopy() as! NSMutableOrderedSet
        
        let entity = NSEntityDescription.entity(forEntityName: "CompletedTask", in: managedContext)!
        let completedTask = NSManagedObject(entity: entity, insertInto: managedContext) as! CompletedTask
        
        completedTask.title = task?.title
        completedTask.belongsToAProject = ((task?.belongsToAProject) != nil)
        completedTask.dueDate = task?.dueDate
        completedTask.status = ((task?.status) != nil)
        
        copy.add(completedTask)
        parent.project.completedTasks = copy
        
        let inProgressCopy = parent.inProgressItems.mutableCopy() as! NSMutableOrderedSet
        inProgressCopy.remove(task!)
        parent.project.tasks = inProgressCopy
        
        do {
            try managedContext.save()
        } catch let error as NSError{
            print(error)
        }
        
        //
        parent.tableView.reloadData()
    }
    
    func setUpCell() {
        checkbox.isHidden = false
        checkbox.isUserInteractionEnabled = true
        checkbox.addTarget(self, action: #selector(checkboxTapped), for: .touchDown)
        self.addSubview(checkbox)
        
        NSLayoutConstraint.activate([
            checkbox.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            checkbox.widthAnchor.constraint(equalToConstant: 20),
            checkbox.heightAnchor.constraint(equalToConstant: 20),
            checkbox.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        addTitle()
    }
    
    func addTitle() {
        self.addSubview(title)
        title.leadingAnchor.constraint(equalTo: checkbox.trailingAnchor, constant: 10).isActive = true
        title.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
