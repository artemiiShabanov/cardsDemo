//
//  TableCell.swift
//  RealmTemplate
//
//  Created by xcode on 21.10.2017.
//  Copyright © 2017 Andrey Volodin. All rights reserved.
//

import UIKit

class WordTableCell: UITableViewCell{
    
    public static let reuseId = "ToDoTableCell_reuseId"
    @IBOutlet weak var NameLabel: UILabel!
    
    public func configure(word:String) {
        NameLabel.text = word
    }
    
    public func setColor(color: UIColor) {
        self.backgroundColor = color
    }
    
    
}
