//
//  ViewController.swift
//  CardDemo
//
//  Created by xcode on 18.11.2017.
//  Copyright © 2017 VSU. All rights reserved.
//

import UIKit
import RealmSwift

//global
var realm:Realm = try! Realm()


class MainViewController: UIViewController {
    
    var words:Results<Word>!
    var state:State?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        words = realm.objects(Word.self).filter(NSPredicate(format: "isInHistory == false"))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addWord(_ sender: Any) {
        let word = Word()
        word.word = "a"
        word.defenition = "fghj"
        word.isFavorite = true
        try! realm.write{
            realm.add(word)
        }
        //self.performSegue(withIdentifier: "AddWordSegue", sender: self)
    }
    
    @IBAction func showFavorite(_ sender: Any) {
        state = .Favorite
        self.performSegue(withIdentifier: "tableSegue", sender: self)
    }
    @IBAction func showHistory(_ sender: Any) {
        state = .History
        self.performSegue(withIdentifier: "tableSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? WordsTableViewController
            else {fatalError("Some Error")}
        destination.state = state
    }
    
}
