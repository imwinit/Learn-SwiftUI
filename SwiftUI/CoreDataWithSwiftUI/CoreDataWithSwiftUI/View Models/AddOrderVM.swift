//
//  AddOrderVM.swift
//  CoreDataWithSwiftUI
//
//  Created by Vineet Kumar on 30/09/20.
//

import Foundation

class AddOrderVM {
    
    var name: String = ""
    var type: String = ""
    
    func saveOrder() {
        CoreDataManager.shared.saveOrder(name: self.name, type: self.type)
    }
    
    
}
