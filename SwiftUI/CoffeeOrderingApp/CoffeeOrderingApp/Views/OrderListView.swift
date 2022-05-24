//
//  OrderListView.swift
//  CoffeeOrderingApp
//
//  Created by Vineet Kumar on 28/09/20.
//

import SwiftUI

struct OrderListView: View {
    
    let orders: [OrderVM]
    
    init(orders: [OrderVM]) {
        self.orders = orders
    }
    
    var body: some View {
    
        List {
            
            ForEach(self.orders, id: \.id) { order in
                HStack {
                    Image(order.coffeeName)
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                        .cornerRadius(16)
                    
                    VStack {
                        Text(order.name)
                            .font(.title)
                            .padding([.leading, .bottom], 10)
                        
                        HStack {
                            Text(order.coffeeName)
                                .padding([.all], 10)
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            
                            Text(order.size)
                                .padding([.all], 10)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(orders: [OrderVM(order: Order.init(name: "Mary", size: "Medium", coffeeName: "Regular", total: 3))])
    }
}
