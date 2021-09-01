//
//  ContentView.swift
//  StocksApp
//
//  Created by Elman Asadi on 9/1/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var stockListVM = StockListViewModel()
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor.black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = UIColor.black
        UITableViewCell.appearance().backgroundColor = UIColor.black
        
        stockListVM.load()
    }
    
    var body: some View {
        
        NavigationView {
            
            ZStack(alignment: .leading) {
                Color.black
                    .frame(height: .infinity)
                    .edgesIgnoringSafeArea(.all)
                
                Text("september 1 2021")
                    .font(.custom("Arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -315)
                
                SearchView(searchTerm: self.$stockListVM.searchTerm)
                    .offset(y: -265)
                
                StockListView(stocks: self.stockListVM.stocks)
                    .offset(y: 95)
                
            }
            .navigationTitle("Stocks")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
