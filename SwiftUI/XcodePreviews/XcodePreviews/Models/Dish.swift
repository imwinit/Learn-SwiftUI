//
//  Dish.swift
//  XcodePreviews
//
//  Created by Vineet Kumar on 28/09/20.
//

import Foundation

struct Dish: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    let image: String
}

extension Dish {
    
    static func all() -> [Dish] {
        
        return [
            Dish.init(name: "Idli", price: 8, image: "idli"),
            Dish.init(name: "Rajma", price: 8, image: "rajma"),
            Dish.init(name: "Dosa", price: 8, image: "dosa")
        ]
    }
}
