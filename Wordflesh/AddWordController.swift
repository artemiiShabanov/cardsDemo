//
//  AddWordController.swift
//  CardDemo
//
//  Created by xcode on 20.11.2017.
//  Copyright © 2017 VSU. All rights reserved.
//

import Foundation
import UIKit

class AddWordController: UIViewController {
  
    @IBAction func add(_ sender: Any) {
        
        let word = Word()
        word.word = wordField.text!
        word.defenition = definitionField.text!
        
        try! realm.write {
            realm.add(word)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var definitionField: UITextView!
    @IBOutlet weak var wordField: UITextField!
    
}

