//
//  NewsArticleVM.swift
//  StocksAppInSwiftUI
//
//  Created by Vineet Kumar on 06/10/20.
//

import Foundation

struct NewsArticleVM {
    
    let article: Article
    
    var imageURL: String {
        return article.imageURL
    }
    
    var title: String {
        return article.title
    }
    
    var publication: String {
        return article.publication.uppercased()
    }
}
