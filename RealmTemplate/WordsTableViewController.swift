//
//  TableWordController.swift
//  RealmTemplate
//
//  Created by xcode on 18.11.2017.
//  Copyright © 2017 Andrey Volodin. All rights reserved.
//

import Foundation
import UIKit

class WordsTableViewController: UITableViewController {
    
    var words:Results<Word>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        words = realm.objects(Word.self).filter(NSPredicate(format: "isInHistory == true"))
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WordTableCell.reuseId) as? WordTableCell
            else {fatalError("Fatal error")
        }
        
        cell.configure(name: words[indexPath.row].name)
        cell.setColor(color: .green)
        
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

