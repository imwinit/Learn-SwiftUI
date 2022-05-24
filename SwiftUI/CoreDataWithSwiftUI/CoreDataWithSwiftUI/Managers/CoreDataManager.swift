//
//  CoreDataManager.swift
//  CoreDataWithSwiftUI
//
//  Created by Vineet Kumar on 30/09/20.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static var shared = CoreDataManager(moc: NSManagedObjectContext.current)
    
    var moc: NSManagedObjectContext
    
    private init(moc: NSManagedObjectContext) {
        self.moc = moc
    }
    
    func saveOrder(name: String, type: String) {
        
        let order = Order(context: self.moc)
        order.name = name
        order.type = type
        
        do {
            try self.moc.save()
        } catch let e {
            print(e.localizedDescription)
        }
    }
    
    func getOrders() -> [Order] {
        
        var orders = [Order]()
        let orderReq: NSFetchRequest<Order> = Order.fetchRequest()
        do {
            orders = try self.moc.fetch(orderReq)
        } catch {}
        return orders
    }
    
    func fetchOrder(name: String) -> Order? {
        var orders = [Order]()
        let orderReq: NSFetchRequest<Order> = Order.fetchRequest()
        orderReq.predicate = NSPredicate(format: "name == %@", name)
        do {
            orders = try self.moc.fetch(orderReq)
        } catch let e {
            print(e.localizedDescription)
        }
        return orders.first
    }
    
    func deleteOrder(name: String) {
        do {
            if let order = fetchOrder(name: name) {
                self.moc.delete(order)
                try moc.save()
            }
        } catch let e {
            print(e.localizedDescription)
        }
    }
}
