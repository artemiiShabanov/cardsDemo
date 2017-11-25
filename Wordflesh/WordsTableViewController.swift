//
//  TableWordController.swift
//  RealmTemplate
//
//  Created by xcode on 18.11.2017.
//  Copyright © 2017 Andrey Volodin. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

enum State {
    case History
    case Favorite
}

class WordsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var words: Results<Word>!
    var state: State?
    var word: Word?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        words = realm.objects(Word.self).filter(NSPredicate(format: state == .History ? "isInHistory == true" : "isFavorite == true"))
        tableView.reloadData()
    }
    
    @IBAction func Home(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WordTableCell.reuseId) as? WordTableCell
        else {
                fatalError("Fatal error")
        }
        
        cell.configure(word: words[indexPath.row].word)
        cell.setColor(color: state == .History ? .yellow : .green)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        word = words[indexPath.row]
        self.performSegue(withIdentifier: state == .Favorite ? "FavoriteSegue" : "HistorySegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let type = (state == .History) ? FavoriteWordViewController : FavoriteWordViewController
        guard let destination = segue.destination as? FavoriteWordViewController
            else {fatalError("Some Error")}
        destination.word = word
    }

}
