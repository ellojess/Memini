//
//  ToDoListViewController.swift
//  Memini
//
//  Created by Jessica Trinh on 6/26/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ToDoListViewController: UIViewController {
    
    var tasks: [NSManagedObject] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    let segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["In Process", "Completed"])
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(pickedSegmentController), for: .valueChanged)
        return sc
    }()
    
    @objc fileprivate func pickedSegmentController() {
        print(segmentedControl.selectedSegmentIndex)
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            allLists = inProgressItems
        case 1:
            allLists = completedItems
        default:
            allLists = inProgressItems
        }
        
        tableView.reloadData()
    }
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    let inProgressItems = ["eat", "walk"]
    
    let completedItems = ["sleep", "yawn", "KICK"]
    
    lazy var allLists = inProgressItems
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavBar()
        setupView()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(ToDoItemsTableCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest <NSManagedObject> (entityName: "Task")
        do {
            tasks = try managedContext.fetch(fetchRequest)
            print("ttttttt")
            print(tasks)
        } catch let error as NSError {
            print(error)
        }
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        self.title = "To Do List"
        
        let addTaskButton = UIBarButtonItem(title: "Add Task", style: .plain, target: self, action: #selector(self.addTask))
        navigationItem.rightBarButtonItem = addTaskButton
        
    }
    
    @objc func addTask() {
        let nextVC = NewTaskItemViewController()
        nextVC.delegate = self
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func setupView() {

        let paddedStackView = UIStackView(arrangedSubviews: [segmentedControl])
        paddedStackView.layoutMargins = .init(top: 12, left: 12, bottom: 6, right: 12)
        paddedStackView.isLayoutMarginsRelativeArrangement = true
        
        let stackView = UIStackView(arrangedSubviews: [paddedStackView, tableView])
        stackView.axis = .vertical
        
        view.addSubview(stackView)
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .zero)
    }
    
}

extension ToDoListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ToDoItemsTableCell
        cell.selectionStyle = .default
        cell.title.text = allLists[indexPath.row]
        return cell
        
//        let task = tasks[indexPath.row]
//        cell.title.text = task.value(forKey: "title") as? String
//        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("delete pressed")
        }
    }
}
