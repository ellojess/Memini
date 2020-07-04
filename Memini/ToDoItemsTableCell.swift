//
//  ToDoItemsTableCell.swift
//  Memini
//
//  Created by Jessica Trinh on 6/30/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import Foundation
import UIKit

class ToDoItemsTableCell: UITableViewCell {
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        return stackView
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Bold", size: 20)
        label.textColor = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
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
    
    var project: Project2? {
        didSet {
            title.text = project?.title
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(stackView)
        
        stackView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.85).isActive = true
        stackView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.75).isActive = true
        stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        stackView.addArrangedSubview(checkbox)
        checkbox.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.12).isActive = true
        checkbox.isHidden = false
        checkbox.isUserInteractionEnabled = true
        
//        checkbox.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12.0).isActive = true
//        checkbox.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        checkbox.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0).isActive = true
        
        checkbox.addTarget(self, action: #selector(checkboxTapped), for: .touchDown)
        
        
        
        stackView.addArrangedSubview(title)
        //        title.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.70).isActive = true
        //        title.leadingAnchor.constraint(equalTo: checkbox.rightAnchor, constant: 10).isActive = true
        
        
        title.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12.0).isActive = true
        title.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        title.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12).isActive = true
//        title.rightAnchor.constraint(equalTo: checkbox.rightAnchor, constant: 24).isActive = true
        title.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 24).isActive = true
        title.leftAnchor.constraint(equalTo: checkbox.rightAnchor, constant: 20).isActive = true
        
    }
    
    @objc func checkboxTapped(){
        if self.checkbox.currentImage == UIImage(named: "unchecked_checkbox"){
            
            UIView.animate(withDuration: 0.3,
                           animations: {
                            self.checkbox.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
            },
                           completion: { _ in
                            UIView.animate(withDuration: 0.3) {
                                self.checkbox.transform = CGAffineTransform.identity
                            }
            })
            
            self.checkbox.setImage(UIImage(named: "checked_checkbox"), for: .normal)
        }else{
            self.checkbox.setImage(UIImage(named: "unchecked_checkbox"), for: .normal)
        }
    }
    
    func setUpTitle() {
        title.translatesAutoresizingMaskIntoConstraints = false
        title.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        title.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
