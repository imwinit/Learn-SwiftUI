//
//  ContentView.swift
//  StocksAppInSwiftUI
//
//  Created by Vineet Kumar on 05/10/20.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject private var stockListVM = StockListVM()
    
    init() {
        UINavigationBar.appearance().backgroundColor = .black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = .black // bug .lisRowBackground also not working iOS 14
        UITableViewCell.appearance().backgroundColor = .black
        
        stockListVM.load()
    }
    
    var body: some View {
        
        let filteredStocks = self.stockListVM.searchTerm.isEmpty ? self.stockListVM.stocks : self.stockListVM.stocks.filter({ $0.symbol.starts(with: self.stockListVM.searchTerm)})
        
        NavigationView {
            
            ZStack(alignment: .leading) {
                
                Color.black
                
                Text("January 5 2020")
                    .font(.custom("Arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -320)
                
                SearchView(searchTerm: $stockListVM.searchTerm)
                    .offset(y: -260)
                
                StockListView(stocks: filteredStocks)
                    .offset(y:250)
                
                NewsArticleView(newsArticles: self.stockListVM.news, onDragBegin: { value in
                    self.stockListVM.dragOffset = value.translation
                }, onDragEnd: { value in
                    
                    if value.translation.height < 0 {
                        self.stockListVM.dragOffset = CGSize(width: 0, height: 100)
                    } else {
                        self.stockListVM.dragOffset = CGSize(width: 0, height: 650)
                    }
                    
                })
                    .animation(.spring())
                    .offset(y: self.stockListVM.dragOffset.height)
            }
            
            .navigationBarTitle("Stocks")
            .ignoresSafeArea()
        }.edgesIgnoringSafeArea(Edge.Set(.bottom))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
