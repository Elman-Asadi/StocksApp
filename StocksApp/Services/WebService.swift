//
//  WebService.swift
//  StocksApp
//
//  Created by Elman Asadi on 9/1/21.
//

import Foundation


class WebService {

    
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
                complition(nil)
                return
            }
            
            do {
                let stocks = try? JSONDecoder().decode([Stock].self, from: data)
                stocks == nil ? complition(nil) : complition(stocks)
            } 
            
        }.resume()
        
    }
    
}
