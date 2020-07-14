//
//  NewTaskItemViewController.swift
//  Memini
//
//  Created by Jessica Trinh on 6/26/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class NewTaskItemViewController: UIViewController {
    
    var delegate: ToDoListViewController?
    
    var task: Task!
    
    var project: Project!
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    let titleSection: UITextField = {
        let textField = UITextField()
        let bottomLine = UIView()
        let titleLabel = UILabel()
        
        textField.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont(name: "AvenirNextCondensed-DemiBold", size: 18)
        titleLabel.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: 5).isActive = true
        titleLabel.textColor = .black
        titleLabel.text = "Title"
        
        textField.attributedPlaceholder = NSAttributedString(string: "e.g. Read 2 chapters of The Illiad",
                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.font = UIFont(name: "AvenirNextCondensed-DemiBold", size: 18)
        textField.textColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addSubview(bottomLine)
        
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        bottomLine.backgroundColor = .white
        bottomLine.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: -2).isActive = true
        bottomLine.leadingAnchor.constraint(equalTo: textField.leadingAnchor).isActive = true
        bottomLine.trailingAnchor.constraint(equalTo: textField.trailingAnchor).isActive = true
        bottomLine.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        return textField
    }()
    
    
    let dateSection: UITextField = {
        let textField = UITextField()
        let bottomLine = UIView()
        let completeByLabel = UILabel()
        
        textField.addSubview(completeByLabel)
        completeByLabel.translatesAutoresizingMaskIntoConstraints = false
        completeByLabel.font = UIFont(name: "AvenirNextCondensed-DemiBold", size: 18)
        completeByLabel.textColor = .black
        completeByLabel.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: 5).isActive = true
        
        completeByLabel.text = "Complete By Date"
        
        textField.attributedPlaceholder = NSAttributedString(string: "mm/dd/yyyy",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.font = UIFont(name: "AvenirNextCondensed-DemiBold", size: 18)
        textField.textColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addSubview(bottomLine)
        
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        bottomLine.backgroundColor = .white
        bottomLine.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: -2).isActive = true
        bottomLine.leadingAnchor.constraint(equalTo: textField.leadingAnchor).isActive = true
        bottomLine.trailingAnchor.constraint(equalTo: textField.trailingAnchor).isActive = true
        bottomLine.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupView()
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        self.title = "Add New Task"
        
        let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(self.saveTask))
        navigationItem.rightBarButtonItem = saveButton
    }
    
    
    @objc func saveTask() {
        guard  let titleText = titleSection.text, !titleText.isEmpty else {
            return
        }
        delegate?.add(belongsToAProject: true, dueDate: "today", status: true, title: titleText)
        delegate?.tableView.reloadData()
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func setupView() {
        
        view.addSubview(stackView)
        stackView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.7).isActive = true
        stackView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.43).isActive = true
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        self.view.backgroundColor = UIColor(red:0.49, green:0.84, blue:0.87, alpha:1.0)
        
        stackView.addArrangedSubview(titleSection)
        titleSection.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        titleSection.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        stackView.setCustomSpacing(20, after: titleSection)
        
        stackView.addArrangedSubview(dateSection)
        dateSection.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        dateSection.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
    }
}

extension NewTaskItemViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard titleSection === titleSection else {
            return
        }
        task.title = titleSection.text ?? ""
    }
}
