//
//  Dish.swift
//  FilterState
//
//  Created by Vineet Kumar on 27/09/20.
//

import Foundation

struct Dish: Identifiable {
    
    let id = UUID()
    let name: String
    let image: String
    let isSpicy: Bool
    
}

extension Dish {
    
    static func all() -> [Dish] {
        
        return [
            Dish(name: "cheetos", image: "cheetos", isSpicy: true),
            Dish(name: "kurkure", image: "kurkure", isSpicy: true),
            Dish(name: "lays", image: "lays", isSpicy: false)
        ]
    }
}
