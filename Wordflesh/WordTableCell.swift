//
//  TableCell.swift
//  RealmTemplate
//
//  Created by xcode on 21.10.2017.
//  Copyright © 2017 Andrey Volodin. All rights reserved.
//

import UIKit

class WordTableCell: UITableViewCell{
    
    @IBOutlet weak var WordLabel: UILabel!
    public static let reuseId = "WordTableCell_reuseId"
    
    public func configure(word:String) {
        WordLabel.text = word
    }
    
    public func setColor(color: UIColor) {
        self.backgroundColor = color
    }
    
}
