//
//  Grid.swift
//  MemoryApp
//
//  Created by Mohamed Omane on 7/2/20.
//  Copyright © 2020 Mohamed Omane. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View  where Item: Identifiable, ItemView: View {
    
    var items: [Item] // an array of items
    var viewForItems: (Item) -> ItemView
    
    
    init(items: [Item], viewForItems: @escaping (Item) -> ItemView) { // @escaping is used to keep variables around until they are declared
        self.items = items
        self.viewForItems = viewForItems
        
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
        }
    }
    
    func body(for layout: GridLayout) -> some View {
        ForEach(items){ item in
            self.body(for: item, in: layout)
        }
    }
    
    func body(for item: Item, in layout: GridLayout) -> some View {
        let index = self.index(of: item)
        return viewForItems(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }
    
    func index(of item: Item) -> Int {
        
        return 0
    }
    
}
