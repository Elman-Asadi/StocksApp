//
//  WebService.swift
//  StocksApp
//
//  Created by Elman Asadi on 9/1/21.
//

import Foundation


class WebService {
    
    // ======== Get Top News ========
    
    func getTopNews(complition: @escaping (([Article]?) -> Void)) {
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 20.0
        configuration.timeoutIntervalForResource = 60.0
        let session = URLSession(configuration: configuration)
        
        
        guard let url = URL(string: "https://island-bramble.glitch.me/top-news") else {
            fatalError("News URL is not correct")
        }
        
        session.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                
                DispatchQueue.main.async {
                    complition(nil)
                }
                return
            }
            
            do {
                let articles = try? JSONDecoder().decode([Article].self, from: data)
                articles == nil ? complition(nil) : complition(articles)
            }
            
        }.resume()
        
    }
    
    // ======== Get Stocks ========
    
    func getStocks(complition : @escaping (([Stock]?) -> Void)) {
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 20.0
        configuration.timeoutIntervalForResource = 60.0
        let session = URLSession(configuration: configuration)
        
        
        guard let url = URL(string: "https://island-bramble.glitch.me/stocks") else {
            fatalError("URL is not correct")
        }
        
        session.dataTask(with: url) { data, response, error in
            guard let data = data , error == nil else {
                
                DispatchQueue.main.async {
                    complition(nil)
                }
                return
            }
            
            do {
                let stocks = try? JSONDecoder().decode([Stock].self, from: data)
                stocks == nil ? complition(nil) : complition(stocks)
            } 
            
        }.resume()
        
    }
    
}
