//
//  ViewController.swift
//  RealmTemplate
//
//  Created by Andrey Volodin on 21.10.17.
//  Copyright © 2017 Andrey Volodin. All rights reserved.
//

import UIKit
import RealmSwift

//global
var realm:Realm = try! Realm()


class ViewController: UITableViewController {

    var words:Results<Word>!
    //var favorite:Results<Word>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        words = realm.objects(Word.self).filter(NSPredicate(format: "isInHistory == false"))
        //favorite = realm.objects(Word.self).filter(NSPredicate(format: "isFavorite == true"))
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "To be done"
        } else if section == 1 {
            return "Done"
        }
        return ""
    } 
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return words?.count ?? 0
        } else if section == 1 {
            return done?.count ?? 0
        }
        return 0
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
            return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WordTableCell.reuseId) as? WordTableCell
            else {fatalError("Fatal error")
        }
        
        if indexPath.section == 0 {
            cell.configure(name: Words[indexPath.row].name, details: Words[indexPath.row].details)
            cell.setColor(color: .green)
        } else if indexPath.section == 1 {
            cell.configure(name: finished[indexPath.row].name, details: finished[indexPath.row].details)
            cell.setColor(color: .red)
        }
        
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var Word: Word
        if indexPath.section == 0 {
            Word = words[indexPath.row]
        } else  {
            Word = done[indexPath.row]
        }
        try! realm.write {
            Word.finished = !Word.finished
        }
        
        viewDidAppear(false)
    }
    
    
    
}


                                 

