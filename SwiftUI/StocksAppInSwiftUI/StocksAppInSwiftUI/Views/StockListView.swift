//
//  StockListView.swift
//  StocksAppInSwiftUI
//
//  Created by Vineet Kumar on 06/10/20.
//

import SwiftUI

struct StockListView: View {
    
    let stocks : [StockVM]
    
    var body: some View {
        
        List(stocks, id: \.symbol) { stock in
            StockCellView(stock: stock)
        }
    }
}

struct StockCellView: View {
    
    let stock: StockVM
    
    var body: some View {
        
        return HStack {
            
            VStack(alignment: .leading, spacing: nil, content: {
                Text(stock.symbol)
                    .font(.custom("Arail", size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                
                Text(stock.description)
                    .font(.custom("Arail", size: 18))
                    .foregroundColor(.gray)
                 
            })
            
            Spacer()
            
            VStack {
                Text(stock.price)
                    .font(.custom("Arail", size: 22))
                    .foregroundColor(.white)
                
                Button(stock.change) {
                    
                }.frame(width: 75)
                .padding(5)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(6)
            }
            
        }
        
    }
}

struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        
        let stock = Stock.init(symbol: "GOD", description: "sdafds", price: 5, change: "sdfads")
        
        return StockListView(stocks: [StockVM(stock: stock)])
    }
}
