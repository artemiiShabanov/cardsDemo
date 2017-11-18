//
//  AddToDoController.swift
//  RealmTemplate
//
//  Created by xcode on 21.10.2017.
//  Copyright © 2017 Andrey Volodin. All rights reserved.
//

import UIKit

class AddToDoController: UIViewController {
    @IBOutlet weak var nameIF: UITextField!
    @IBOutlet weak var detailsIF: UITextField!
    
    @IBAction func donePressed(_ sender: Any) {
        guard nameIF.text != "" else {
            let alert = UIAlertController(title: "ToDo must have a name", message: "Please enter a valid ToDo Name", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        let todo = Todo()
        todo.name = nameIF.text!
        todo.details = detailsIF.text!
        todo.finished = false
        
        try! realm.write {
            realm.add(todo)
        }
        
        _ = self.navigationController?.popViewController(animated: true)
    }
}
