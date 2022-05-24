//
//  OrderListVM.swift
//  CoffeeOrderingApp
//
//  Created by Vineet Kumar on 28/09/20.
//

import Foundation

class OrderListVM: ObservableObject {
    
    @Published var orders: [OrderVM] = []
    
    init() {
        fetchOrders()
    }
    
    func fetchOrders() {
        
        CoffeeService().getAllOrders { (orders) in
            if let orders = orders {
                self.orders = orders.map(OrderVM.init)
            }
        }
    }
}

class OrderVM {
    
    let id = UUID()
    
    var order: Order
    
    init(order: Order) {
        self.order = order
    }
    
    var name: String {
        return self.order.name
    }
    
    var size: String {
        return self.order.size
    }
    
    var coffeeName: String {
        return self.order.coffeeName
    }
    
    var total: Double {
        return self.order.total
    }
}
