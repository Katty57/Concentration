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
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    var cards = [Card]()
    
    func chooseCard (at index: Int){
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFacedUp = false
                }
                indexOfOneAndOnlyFaceUpCard = index
            }
            cards[index].isFacedUp = true
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
