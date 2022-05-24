//
//  ContentView.swift
//  XcodePreviews
//
//  Created by Vineet Kumar on 28/09/20.
//

import SwiftUI

struct ContentView: View {
    
    let dishes = Dish.all()
    
    var body: some View {
        
        List {
            
            ForEach(dishes) { dish in
                DishCell(dish: dish)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
