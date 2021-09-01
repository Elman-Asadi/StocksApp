//
//  StockListViewModel.swift
//  StocksApp
//
//  Created by Elman Asadi on 9/1/21.
//

import Foundation

class StockListViewModel : ObservableObject {
    
    @Published var searchTerm : String = ""
    @Published var stocks : [StockViewModel] = [StockViewModel]()
    @Published var news : [NewsArticleViewModel] = [NewsArticleViewModel]()
    
    func load() {
        fetchStocks()
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
