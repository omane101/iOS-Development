//
//  Game.swift
//  MemoryApp
//
//  Created by Mohamed Omane on 6/18/20.
//  Copyright © 2020 Mohamed Omane. All rights reserved.
//

import Foundation

struct Game<CardContent> {
    var cards: Array<Card>
    
    init(numOfPairs: Int, cardFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for i in 0..<numOfPairs{
            let content = cardFactory(i)
            cards.append(Card(isFaceUp: false, isMatched: false, content: content))
            cards.append(Card(isFaceUp: false, isMatched: false, content: content))
        }
            
    }
    
    
    func choose(card: Card) {
        print("card chosen: \(card)")
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
        
    }
}
