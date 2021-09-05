//
//  StockListViewModel.swift
//  StocksApp
//
//  Created by Elman Asadi on 9/1/21.
//

import SwiftUI

class StockListViewModel : ObservableObject {
    
    @Published var dragOffset : CGSize = CGSize(width: 0.0, height: 100)
    @Published var searchTerm : String = ""
    @Published var stocks : [StockViewModel] = [StockViewModel]()
    @Published var news : [NewsArticleViewModel] = [NewsArticleViewModel]()
    
    func load() {
        fetchStocks()
        fetchNews()
    }
    
    // ======= Fetch News =======
    
    private func fetchNews() {
        WebService().getTopNews { articles in
            if let articles = articles {
                DispatchQueue.main.async {
                    self.news = articles.map(NewsArticleViewModel.init)
                }
            }
        }
    }
    
    
    // ======= Fetch Stocks =======
    
    private func fetchStocks() {
        
        WebService().getStocks { stocks in
            if let stocks = stocks {
                DispatchQueue.main.async {
                    self.stocks = stocks.map(StockViewModel.init)
                }
            }
        }
    }
    
}
