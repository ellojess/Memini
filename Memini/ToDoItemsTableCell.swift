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
    
    let title: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Bold", size: 20)
        label.textColor = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    let subtitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-light", size: 11)
        label.textColor = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    var project: Project? {
        didSet {
            title.text = project?.title
            subtitle.text = project?.subtitle
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(title)
        addSubview(subtitle)
    }
         
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
