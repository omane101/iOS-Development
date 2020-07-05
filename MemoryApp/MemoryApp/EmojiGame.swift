//
//  EmojiGame.swift
//  MemoryApp
//
//  Created by Mohamed Omane on 6/18/20.
//  Copyright © 2020 Mohamed Omane. All rights reserved.
//

import SwiftUI

func get_index(index: Int, arr: Array<String>) -> String {
    return arr[index]
}

class EmojiGame: ObservableObject {
    @Published private var game: Game<String> = createNewGame() // @Published is a property wrapper, everytime this var changes it calles objectWillChange.send()
    
    static func createNewGame() -> Game<String> {
        let emojis: Array<String> = ["🦇", "👹", "🎃"]
        return Game<String>(numOfPairs: emojis.count){pair in
            return emojis[pair]
        }
    }
    
    // MARK: - Access to the model
    var cards: Array<Game<String>.Card> {
        game.cards
    }
    //MARK: - Intents(s)
    func choose(card: Game<String>.Card){
        objectWillChange.send()
        game.choose(card)
    }
}


