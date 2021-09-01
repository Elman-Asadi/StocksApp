//
//  Stock.swift
//  StocksApp
//
//  Created by Elman Asadi on 9/1/21.
//

import Foundation


struct Stock : Codable {
    
    let symbol : String
    let description : String
    let price : Double
    let change : String
    
}
