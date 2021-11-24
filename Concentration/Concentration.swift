//
//  Concentration.swift
//  Concentration
//
//  Created by  User on 17.11.2021.
//  Copyright © 2021 abr. All rights reserved.
//

import Foundation

class Concentration {
    let numberOfCards: Int = 0
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter{cards[$0].isFacedUp}.oneAndOnly
        }
        set {
            
            for index in cards.indices {
                cards[index].isFacedUp = (index == newValue)
            }
        }
    }
    
    private(set) var cards = [Card]()
    
    func chooseCard (at index: Int){
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFacedUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsCards: Int) {
        for _ in 0..<numberOfPairsCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
}

extension Collection {
    var oneAndOnly: Element? {
        return self.count == 1 ? self.first : nil
    }
}
