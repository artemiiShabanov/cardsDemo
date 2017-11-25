//
//  FavoriteWordViewController.swift
//  RealmTemplate
//
//  Created by xcode on 25.11.2017.
//  Copyright © 2017 Andrey Volodin. All rights reserved.
//

import UIKit

class FavoriteWordViewController: UIViewController {
    
    var word:Word?
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var definitionLabel: UILabel!
    
    @IBOutlet weak var wordLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        wordLabel.text = word?.word
        definitionLabel.text = word?.defenition
    }
    
    @IBAction func starPressed(_ sender: Any) {
        if word!.isFavorite {
            starButton.tintColor = .gray
            try! realm.write {
                word?.isFavorite = false
            }
        }
        else {
            starButton.tintColor = .yellow
            try! realm.write {
                word?.isFavorite = true
            }
        }
        
    }
    @IBAction func exit(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
