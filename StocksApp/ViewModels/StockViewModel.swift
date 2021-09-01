//
//  StockViewModel.swift
//  StocksApp
//
//  Created by Elman Asadi on 9/1/21.
//

import Foundation


struct StockViewModel {
    
    let stock : Stock
    
    var symbol : String {
        return self.stock.symbol.uppercased()
    }
    
    var description : String {
        return stock.description
    }
    
    var price : String {
        return String(format: "%.2f", self.stock.price)
    }
    
    var change : String {
        return self.stock.change
    }
    
}
