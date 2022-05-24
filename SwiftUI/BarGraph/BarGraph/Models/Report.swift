//
//  Report.swift
//  BarGraph
//
//  Created by Vineet Kumar on 29/09/20.
//

import Foundation

struct Report: Hashable {
    
    let year: String
    let revenue: Double
}

extension Report {
    
    static func all() -> [Report] {
        return [
            Report.init(year: "2012", revenue: 50),
            Report.init(year: "2013", revenue: 60),
            Report.init(year: "2014", revenue: 100)
        ]
    }
}
