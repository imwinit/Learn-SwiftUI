//
//  Webservices.swift
//  StocksAppInSwiftUI
//
//  Created by Vineet Kumar on 05/10/20.
//

import Foundation

class Webservices {
    
    func getStocks(completion: @escaping ([Stock]?)->()) {
        
        guard let url = URL(string: "https://island-bramble.glitch.me/stocks") else { return }
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            stocks == nil ? completion(nil) : completion(stocks)
            
        }.resume()
    }
    
    func getTopNews(completion: @escaping ([Article]?)->()) {
        
        guard let url = URL(string: "https://island-bramble.glitch.me/top-news") else { return }
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            let articles = try? JSONDecoder().decode([Article].self, from: data)
            articles == nil ? completion(nil) : completion(articles)
            
        }.resume()
    }
}
