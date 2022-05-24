//
//  DishesTableVC.swift
//  XcodePreviewForUIKit
//
//  Created by Vineet Kumar on 28/09/20.
//

import Foundation
import UIKit
import SwiftUI

class DishesTableVC: UITableViewController {
    
    private let dishes = Dish.all()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Segue Action
    @IBSegueAction func showDetail(_ coder: NSCoder) -> UIViewController? {
        
        guard let indexPath = self.tableView.indexPathForSelectedRow else {
            fatalError("")
        }
        
        let dish = dishes[indexPath.row]
        
        let dishDetailView = DishDetailView(dish: dish)
        return UIHostingController(coder: coder, rootView: dishDetailView)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DishCell", for: indexPath)
        cell.textLabel?.text = dishes[indexPath.row].name
        cell.imageView?.image = UIImage(named: dishes[indexPath.row].image)
        return cell
    }
}
    
