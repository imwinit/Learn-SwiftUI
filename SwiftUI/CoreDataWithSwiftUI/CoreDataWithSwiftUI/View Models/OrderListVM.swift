//
//  OrderListVM.swift
//  CoreDataWithSwiftUI
//
//  Created by Vineet Kumar on 30/09/20.
//

import Foundation
import SwiftUI
import CoreData
import Combine

class OrderListVM: ObservableObject {
    
    @Published var orders = [OrderVM]()
    
    init() {
        fetchAllOrders()
    }
    
    func fetchAllOrders() {
        self.orders = CoreDataManager.shared.getOrders().map(OrderVM.init)
    }
    
    func deleteOrder(_ orderVM: OrderVM) {
        CoreDataManager.shared.deleteOrder(name: orderVM.name)
        fetchAllOrders()
    }
}

class OrderVM {
    
    var name: String = ""
    var type: String = ""
    
    init(order: Order) {
        self.name = order.name! // Xcode Bug non-optional declared still optional
        self.type = order.type!
    }
}
