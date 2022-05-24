//
//  StockListVM.swift
//  StocksAppInSwiftUI
//
//  Created by Vineet Kumar on 06/10/20.
//

import Foundation
import CoreGraphics

class StockListVM: ObservableObject {
    
    @Published var searchTerm: String = ""
    @Published var stocks: [StockVM] = []
    @Published var news: [NewsArticleVM] = []
    @Published var dragOffset: CGSize = CGSize(width: 0, height: 650)
    
    func load() {
        fetchStocks()
        fetchNews()
    }
    
    private func fetchStocks() {
        
        Webservices().getStocks { stocks in
            if let stocks = stocks {
                DispatchQueue.main.async {
                    self.stocks = stocks.map(StockVM.init)
                }
            }
        }
    }
    
    private func fetchNews() {
        
        Webservices().getTopNews { news in
            if let news = news {
                DispatchQueue.main.async {
                    self.news = news.map(NewsArticleVM.init)
                }
            }
        }
    }
}

struct StockVM {
    
    let stock: Stock
    
    var symbol: String {
        return stock.symbol.uppercased()
    }
    
    var description: String {
        return stock.description
    }
    
    var price: String {
        return String(format: "%.2f", stock.price)
    }
    
    var change: String {
        return stock.change
    }
}
