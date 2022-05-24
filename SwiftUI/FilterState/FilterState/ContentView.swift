//
//  ContentView.swift
//  FilterState
//
//  Created by Vineet Kumar on 27/09/20.
//

import SwiftUI

struct ContentView: View {
    
    var dishes = Dish.all()
    
    @State private var isSpicy = false
    // Whenever need to change state of your view use state // Lemon Words
    // Apple recommends state to be private/local
    
    var body: some View {
    
        List {
            
            Toggle(isOn: $isSpicy) { // Two way binding between state & toogle
                Text("Spicy")
                    .font(.title)
            }

            ForEach(dishes.filter({ $0.isSpicy == self.isSpicy})) { dish in
                
                HStack {
                    
                    Image(dish.image)
                        .resizable()
                        .frame(width: 100, height:100)
                    
                    Text(dish.name)
                        .font(.title)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    if dish.isSpicy {
                        Image("spicy")
                            .resizable()
                            .frame(width: 35, height:35)
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
