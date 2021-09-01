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
    
    func load() {
        fetchStocks()
    }
    
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
