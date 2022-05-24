//
//  Animal.swift
//  SwiftUIForAllDevices
//
//  Created by Vineet Kumar on 01/10/20.
//

import Foundation

struct Animal: Hashable {
    let name: String
    let desc: String
    let image: String
}

extension Animal {
    
    static var placeholder: Animal {
        return Animal.init(name: "", desc: "", image: "")
    }
}
