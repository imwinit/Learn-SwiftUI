//
//  HIke.swift
//  Navigation+List
//
//  Created by Vineet Kumar on 27/09/20.
//

import Foundation

struct Hike {
    
    let id: Int
    let name: String
    let image: String
    let miles: Double
}

extension Hike {
    
    static func all() -> [Hike] {
        return [
            Hike(id: 1, name: "BirBilling", image: "bir", miles: 10),
            Hike(id: 2, name: "Triund", image: "triund", miles: 6),
            Hike(id: 3, name: "Tungnath", image: "tungnath", miles: 7)
        ]
    }
}
