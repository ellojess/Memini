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
    
    /*let buttons: UIHostingController = {
        let buttons = UIHostingController(rootView: ContentView())
        return buttons
    }()*/
    
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
//        stackView.distribution = .fill
        return stackView
    }()
    
    let nameTextField: UITextField = {
        let nameTextField = UITextField()
        let bottomLine = UIView()
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Name your project",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        nameTextField.font = UIFont(name: "AvenirNextCondensed-DemiBold", size: 18)
        nameTextField.textColor = .white
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.addSubview(bottomLine)
        
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        bottomLine.backgroundColor = .white
        bottomLine.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: -2).isActive = true
        bottomLine.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true
        bottomLine.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor).isActive = true
        bottomLine.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        return nameTextField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .orange
        setupNavBar()
//        self.view.addSubview(nameTextField)
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
        view.addSubview(buttonContainer)
        view.addSubview(stackView)
        stackView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.7).isActive = true
        stackView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.05).isActive = true
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        stackView.addArrangedSubview(nameTextField)
        
        let buttonGrid = UIHostingController(rootView: ContentView())
        
//        addChild(buttonGrid)
////        buttonGrid.view.frame = frame
//        view.addSubview(buttonGrid.view)
//        buttonGrid.didMove(toParent: self)
        
        buttonContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        buttonContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       
        let buttonView = UIHostingController(rootView: ContentView())
        buttonView.view.frame = buttonContainer.bounds
        buttonContainer.addSubview(buttonView.view)
        buttonView.didMove(toParent: self)
        
    }
    


}
