//
//  NewTaskViewController.swift
//  Memini
//
//  Created by Jessica Trinh on 6/26/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class NewTaskViewController: UIViewController {
    
    let buttonContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let nameTextField: UITextField = {
        let nameTextField = UITextField()
        let bottomLine = UIView()
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Name your project",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        nameTextField.font = UIFont(name: "AvenirNextCondensed-DemiBold", size: 18)
        nameTextField.textColor = .black
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.addSubview(bottomLine)
        
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        bottomLine.backgroundColor = .black
        bottomLine.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10).isActive = true
        bottomLine.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true
        bottomLine.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor).isActive = true
        bottomLine.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        return nameTextField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavBar()
        setupView()
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        self.title = "New Project"
        
        let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(self.saveTask))
        navigationItem.rightBarButtonItem = saveButton
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelAdd))
        self.navigationItem.leftBarButtonItem = cancelButton
    }
    
    @objc func saveTask() {
        //        let nextVC = HomeViewController()
        //        self.navigationController?.pushViewController(nextVC, animated: true)
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func cancelAdd() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setupView() {
        view.addSubview(nameTextField)
        view.addSubview(buttonContainer)
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 20.0),
            
            buttonContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100)
            
        ])
        
        let buttonView = UIHostingController(rootView: ContentView())
        buttonView.view.frame = buttonContainer.bounds
        buttonContainer.addSubview(buttonView.view)
        buttonView.didMove(toParent: self)
        
    }
    
    
    
}

