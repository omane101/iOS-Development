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
    
    // we use the mutating keyword to let swift know we are changing self
    mutating func choose(_ card: Card) { // we use the _ to denote user does not need to specify (card: MyCard), instead just indicate (MyCard)
        print("card chosen: \(card)")
        let chosenIndex: Int = self.index(of: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int {
        // for i in range(0,len(cards))
        //      if cards[i] == of
        //          return i
        //      else
        //          i+=1
        // return 0
        for index in 0..<self.cards.count{
            if self.cards[index].id == card.id {
                return index
            }
        }
        return 0 // TODO: do not return 0 if card not found
    }
    
    init(numOfPairs: Int, cardFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for i in 0..<numOfPairs{
            let content = cardFactory(i)
            cards.append(Card(isFaceUp: false, isMatched: false, content: content, id: i*10))
            cards.append(Card(isFaceUp: false, isMatched: false, content: content, id: i*10+1))
        }
        cards = cards.shuffled()
        
    }
    
    
    struct Card: Identifiable{
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
        var id: Int
       
    }
}
