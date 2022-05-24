//
//  Stock.swift
//  StocksAppInSwiftUI
//
//  Created by Vineet Kumar on 06/10/20.
//

import Foundation

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: Double
    let change: String
}
