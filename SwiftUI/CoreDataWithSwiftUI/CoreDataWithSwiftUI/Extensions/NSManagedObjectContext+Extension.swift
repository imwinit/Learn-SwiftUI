//
//  NSManagedObjectContext+Extension.swift
//  CoreDataWithSwiftUI
//
//  Created by Vineet Kumar on 30/09/20.
//

import Foundation
import UIKit
import CoreData

extension NSManagedObjectContext {
    
    static var current: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
