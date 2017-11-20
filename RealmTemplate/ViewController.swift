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


class ViewController: UIViewController {
    
    var words:Results<Word>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        words = realm.objects(Word.self).filter(NSPredicate(format: "isInHistory == false"))
        //favorite = realm.objects(Word.self).filter(NSPredicate(format: "isFavorite == true"))
        //tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addWord(_ sender: Any) {
        self.performSegue(withIdentifier: "AddWordSegue", sender: self)
    }
    
    @IBAction func showFavorite(_ sender: Any) {
        self.performSegue(withIdentifier: "TableSegue", sender: self)
    }
    @IBAction func showHistory(_ sender: Any) {
        self.performSegue(withIdentifier: "TableSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     /*guard let destination = segue.destination as? WordsTableViewController
     else {fatalError("Some Error")}*/
     
     //destination.text = posts[currentRow].body
     //destination.id = posts[currentRow].id
     
     }
    
}
