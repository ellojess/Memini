//
//  NewTaskViewController.swift
//  Memini
//
//  Created by Jessica Trinh on 6/26/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import Foundation
import UIKit

class NewTaskViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .orange
        setupNavBar()
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
    


}
