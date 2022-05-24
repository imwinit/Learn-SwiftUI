//
//  Coffee.swift
//  CoffeeOrderingApp
//
//  Created by Vineet Kumar on 28/09/20.
//

import Foundation

struct Coffee {
    
    let name: String
    let imageURL: String
    let price: Double
}

extension Coffee {
    
    static func all() -> [Coffee] {
        return [
            Coffee.init(name: "Cappuccino", imageURL: "Cappuccino", price: 2.5),
            Coffee.init(name: "Expresso", imageURL: "Expresso", price: 2.1),
            Coffee.init(name: "Regular", imageURL: "Regular", price: 1.0)
        ]
    }
}
