//
//  OrderTotalView.swift
//  CoffeeOrderingApp
//
//  Created by Vineet Kumar on 28/09/20.
//

import SwiftUI

struct OrderTotalView: View {
    
    let total: Double
    
    var body: some View {
        
        HStack(alignment: .center, spacing: nil, content: {
            Spacer()
            Text(String.init(format: "%.2f", self.total))
                .font(.title)
                .foregroundColor(.green)
            Spacer()
        })
    }
}

struct OrderTotalView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTotalView(total: 100)
    }
}

