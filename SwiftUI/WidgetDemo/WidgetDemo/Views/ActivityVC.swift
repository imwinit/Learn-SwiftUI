//
//  ActivityVC.swift
//  WidgetDemo
//
//  Created by Vineet Kumar on 22/10/20.
//

import UIKit

class ActivityVC: UIViewController {

    var imgStr = "Activity"
    @IBOutlet weak var labelMain: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelMain.text = imgStr
        view.backgroundColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
    }
    
}
