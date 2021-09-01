//
//  StockListView.swift
//  StocksApp
//
//  Created by Elman Asadi on 9/1/21.
//

import SwiftUI

struct StockListView: View {
    
    let stocks : [StockViewModel]
    
    var body: some View {
        
        List(self.stocks, id: \.symbol) { stock in
            StockCellView(stock: stock)
        }
        .background(Color.black)
        
    }
    
    struct StockCellView : View {
        let stock : StockViewModel
        
        var body: some View {
            HStack {
                VStack(alignment: .leading) {
                    Text(stock.symbol)
                        .font(.custom("Arial", size: 22))
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                    
                    Text(stock.description)
                        .font(.custom("Arial", size: 18))
                        .foregroundColor(Color.gray)
                    
                }
                
                Spacer()
                
                VStack {
                    Text(stock.price)
                        .foregroundColor(Color.black)
                        .font(.custom("Arial", size: 22))
                    
                    Button(stock.change) {
                        
                    }
                    .frame(width: 75)
                    .padding(5)
                    .background(Color.red)
                    .foregroundColor(Color.white)
                    .cornerRadius(6)
                }
                
                
            }
        }
        
    }
    
    
}

struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        
        let stock = Stock(symbol: "sadsa", description: "dasfewg", price: 20.0, change: "10")
        
        StockListView(stocks: [StockViewModel(stock: stock)])
    }
}
