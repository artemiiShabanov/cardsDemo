//
//  TodoModel.swift
//  RealmTemplate
//
//  Created by xcode on 21.10.2017.
//  Copyright © 2017 Andrey Volodin. All rights reserved.
//

import RealmSwift

class Word: Object {
    @objc dynamic public var word = ""
    @objc dynamic public var desc = ""
    @objc dynamic public var isInHistory:Bool = false
    @objc dynamic public var isFavorite:Bool = false
}


