//
//  EmojiGame.swift
//  MemoryApp
//
//  Created by Mohamed Omane on 6/18/20.
//  Copyright © 2020 Mohamed Omane. All rights reserved.
//

import SwiftUI

func createNewCard(index: Int) -> String {
    let emojis: Array<String> = ["🦇", "👹"]
    for index in 0..<4 {
        return emojis[index]
    }
}

class EmojiGame {
    private var game: Game<String> = createNewGame()
    
    static func createNewGame() -> Game<String> {
        return Game<String>(numOfPairs: 2, cardFactory: createNewCard)
    }
    
    // MARK: - Access to the model
    var cards: Array<Game<String>.Card> {
        game.cards
    }
    //MARK: - Intents(s)
    func choose(card: Game<String>.Card){
        game.choose(card: card)
    }
}


