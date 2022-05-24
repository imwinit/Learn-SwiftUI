//
//  AnimalService.swift
//  SwiftUIForAllDevices
//
//  Created by Vineet Kumar on 01/10/20.
//

import Foundation

class AnimalService {
    
    static func getAll() -> [Animal] {
        return [
            Animal.init(name: "Cat", desc: "This is cat", image: "🐕"),
            Animal.init(name: "Rat", desc: "This is Rat", image: "🐭"),
            Animal.init(name: "Girrafe", desc: "This is Girrafe", image: "🦒"),
            Animal.init(name: "Dog", desc: "This is Dog", image: "🐶")
        ]
    }
}
