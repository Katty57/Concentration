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
    private var identifier: Int
    
    private static var indetifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        Card.indetifierFactory += 1
        return Card.indetifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}

extension Card: Hashable, Equatable {
    var hashValue: Int {return identifier}
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
