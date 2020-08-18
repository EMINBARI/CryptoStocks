//
//  CryptoCurrencyLoader.swift
//  CryptoStocks
//
//  Created by Emin Bari on 17.08.2020.
//

import Foundation


class CryptoLoader {
    
    private let baseURL = "https://min-api.cryptocompare.com/data/pricemultifull"
    private let BTC = "BTC"
    private let selectedCurrencies  = "\(currencyCode.EUR.rawValue),\(currencyCode.GBP.rawValue),\(currencyCode.USD.rawValue)"
    
    private var requestURL: String {
        get {
            return baseURL + "?fsyms=" + BTC + "&tsyms=" + selectedCurrencies
        }
    }
    
    func load(complited: @escaping (Result<CryptoCurrencyData, Error>) -> Void) {
        guard let url = URL(string: requestURL) else {
            return assertionFailure("Url is not correct")
        }
        
        URLSession.shared.dataTask(with: url) { (data, respons, error) in
            if error == nil {
                DispatchQueue.main.sync() {
                    let loadedCryptoData = try? JSONDecoder().decode(CryptoCurrencyData.self, from: data!)
                    complited(.success(loadedCryptoData!))
                }
            }
        }.resume()
    }
    
}

