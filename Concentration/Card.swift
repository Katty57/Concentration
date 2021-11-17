//
//  Card.swift
//  Concentration
//
//  Created by  User on 17.11.2021.
//  Copyright © 2021 abr. All rights reserved.
//

import Foundation

struct Card {
    var isFacedUp = false
    var isMatched = false
    var identifier: Int
    
    static var indetifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        Card.indetifierFactory += 1
        return Card.indetifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}
