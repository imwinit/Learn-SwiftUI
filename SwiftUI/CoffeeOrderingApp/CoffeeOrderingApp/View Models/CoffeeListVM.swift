//
//  CoffeVM.swift
//  CoffeeOrderingApp
//
//  Created by Vineet Kumar on 28/09/20.
//

import Foundation

class CoffeeListVM {
    var coffeeList: [CoffeeVM] = []
}

class CoffeeVM {
    
    var coffee: Coffee
    
    init(coffee: Coffee) {
        self.coffee = coffee
    }
    
    var name: String {
        return self.coffee.name
    }
    
    var image: String {
        return self.coffee.imageURL
    }
    
    var price: Double {
        return self.coffee.price
    }
}

