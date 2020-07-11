//
//  HomeTableCell.swift
//  Memini
//
//  Created by Jessica Trinh on 6/27/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import Foundation
import UIKit

class HomeTableCell: UITableViewCell {
    
    let title: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Bold", size: 20)
        label.textColor = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    let color: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "unchecked_checkbox"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.isUserInteractionEnabled = false
        return button
    }()
    
    let subtitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-light", size: 11)
        label.textColor = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    var project: Project2? {
        didSet {
            title.text = project?.title
//            subtitle.text = project?.subtitle
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(title)
        addSubview(subtitle)
        addSubview(color)
        
        
        NSLayoutConstraint.activate([
            
            title.leadingAnchor.constraint(equalTo: color.trailingAnchor, constant: 20),
            title.topAnchor.constraint(equalTo: centerYAnchor, constant: title.font.lineHeight / 2 * -1),
            
            color.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            color.widthAnchor.constraint(equalToConstant: 20),
            color.heightAnchor.constraint(equalToConstant: 20),
            color.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
