//
//  ContentView.swift
//  MemoryApp
//
//  Created by Mohamed Omane on 6/17/20.
//  Copyright © 2020 Mohamed Omane. All rights reserved.
//

import SwiftUI

struct EmojiGameView: View { // structs are value types and do not live in the heap
    @ObservedObject var model: EmojiGame
    
    var body: some View {
        Grid(model.cards){
            ForEach(model.cards) { card in
                CardView(card: card).onTapGesture {
                    self.model.choose(card: card)
                }
            }
        .padding()
        }
        .padding()
        .foregroundColor(Color.orange)
    }

}
    
struct CardView: View {
    var card: Game<String>.Card
    
    var body: some View {
        GeometryReader (content: { geometry in // geometry reader is a container view that defines its content as a function of its own size and coordinate space
            self.body(for: geometry.size)
            })
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if self.card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(self.card.content)
            } else{
                RoundedRectangle(cornerRadius: cornerRadius).fill()
            }
        }
        .font(Font.system(size: fontSize(for: size)))

    }
    
    // MARK: - Drawing Constants
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * self.fontScaleFactor
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiGameView(model: EmojiGame())
    }
}


//    func placed_contents(original_arr: Array<Game<String>.Card>) -> Array<Game<String>.Card>{
//        var new_arr = Array<Game<String>.Card>()
//        let size = original_arr.count
//        while new_arr.count != size{
//            let curr: Game<String>.Card
//            curr = original_arr.randomElement() ?? Game.Card(isFaceUp: true, isMatched: false, content: "", id: 0)
//            let contained = arr_contains(arr: new_arr, card: curr)
//            if contained == false {
//                new_arr.append(curr)
//            }
//        }
//        return new_arr
//    }
//
//    func arr_contains(arr: Array<Game<String>.Card>, card: Game<String>.Card) -> Bool{
//        for pair in arr{
//            if pair.content == card.content{
//                return true
//            }
//        }
//        return false
//    }
//
