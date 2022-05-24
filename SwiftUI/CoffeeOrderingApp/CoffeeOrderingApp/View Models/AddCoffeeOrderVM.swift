//
//  AddCoffeeOrderVM.swift
//  CoffeeOrderingApp
//
//  Created by Vineet Kumar on 28/09/20.
//

import Foundation

class AddCoffeeOrderVM: ObservableObject {
    
    var name: String = ""
    @Published var size: String = "Medium"
    @Published var coffeeName: String = ""
    
    private var coffeeservice: CoffeeService
    
    var coffeeList: [CoffeeVM] {
        return Coffee.all().map(CoffeeVM.init)
    }
    
    init() {
        self.coffeeservice = CoffeeService()
    }
    
    var total: Double {
        return calcTotalPrice()
    }
    
    func placeOrder() {
        
        let order = Order.init(name: self.name, size: self.size, coffeeName: self.coffeeName, total: self.total)
        
        coffeeservice.createCoffeeOrder(order: order) { _ in
            
        }
    }
    
    private func priceForSize() -> Double {
        let prices = ["Small":2.0,"Medium":3.0,"Large":4.0]
        return prices[self.size]!
    }
    
    private func calcTotalPrice() -> Double {
        let coffeeVM = coffeeList.first { $0.name == coffeeName}
        if let coffeeVM = coffeeVM {
            return coffeeVM.price * priceForSize()
        }
        return 0
    }
}
