//
//  Coin.swift
//  CoinCalculator
//
//  Created by Jacob Pashman on 4/11/18.
//  Copyright © 2018 jacobpashman. All rights reserved.
//

import Foundation
import CryptoCurrencyKit

class Coin {
    
    var price: Double = 0.0
    var id: String = ""
    var name: String = ""
    var rank: Int = 0
    var availableSupply: Double = 0.0
    var totalSupply: Double = 0.0
    var percentChange1h: Double = 0.0
    var percentChange24h: Double = 0.0
    var percentChange7d: Double = 0.0
    var symbol: String = ""
    var amountOwned: Double = 0.0
    var datePurchased = Date()
    
    
    
    
    init(name: String) {
        self.name = name
        fetch()
    }
    
    fileprivate func extractedFunc(_ response: (CryptoCurrencyKit.ResponseD<Ticker>)) {
        switch response {
        case .success(let coin):
            //self.name = coin.name
            self.id = coin.id
            self.price = coin.priceUSD!
            self.rank = coin.rank
            self.availableSupply = coin.availableSupply!
            self.totalSupply = coin.totalSupply!
            self.percentChange1h = coin.percentChange1h!
            self.percentChange24h = coin.percentChange24h!
            self.percentChange7d = coin.percentChange7d!
            
            self.symbol = coin.symbol
        case .failure(let error):
            print(error)
        }
    }
    
    func fetch() {
        CryptoCurrencyKit.fetchTicker(coinName: name, convert: .usd) { response in
            self.extractedFunc(response)
        }
    }

    
}
