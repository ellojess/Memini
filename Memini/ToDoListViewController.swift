//
//  ToDoListViewController.swift
//  Memini
//
//  Created by Jessica Trinh on 6/26/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import Foundation
import UIKit

class ToDoListViewController: UIViewController {
    
    let segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["In Process", "Completed"])
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavBar()
        setupView()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(ToDoItemsTableCell.self, forCellReuseIdentifier: "cell")
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
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ToDoItemsTableCell
        cell.selectionStyle = .default
        
        return cell
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
