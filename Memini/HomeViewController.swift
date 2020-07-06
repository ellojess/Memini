//
//  ViewController.swift
//  Memini
//
//  Created by Jessica Trinh on 6/26/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController {
        
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 90
        return tableView
    }()
    
    var projects: [NSManagedObject] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
//    var projects: [Project] = [] {
//        didSet {
//            tableView.reloadData()
//        }
//    }
    
//    var projects: [Project2] = [] {
//        didSet {
//            tableView.reloadData()
//        }
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupTableView()
        tableView.register(HomeTableCell.self, forCellReuseIdentifier: "cell")
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest <NSManagedObject> (entityName: "Project")
        do {
            projects = try managedContext.fetch(fetchRequest)
            print("sssss")
            print(projects)
        } catch let error as NSError {
            print(error)
        }
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        self.title = "Home"
        
        let newButton = UIBarButtonItem(title: "New", style: .plain, target: self, action: #selector(self.newTask))
        navigationItem.rightBarButtonItem = newButton
        
        
    }
    
    @objc func newTask() {
        let nextVC = NewTaskViewController()
        nextVC.delegate = self
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func setupTableView(){
        view.addSubview(tableView)
        view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
    }


}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableCell
        cell.selectionStyle = .default
        let project = projects[indexPath.row]
        cell.title.text = project.value(forKey: "name") as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected item in row \(indexPath.row)")
        let nextView: ToDoListViewController = ToDoListViewController()
        self.navigationController?.pushViewController(nextView, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("delete pressed")
        }
    }
    

    
    
}

