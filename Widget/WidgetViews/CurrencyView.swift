//
//  CurrencyView.swift
//  CryptoStocks
//
//  Created by Emin Bari on 17.08.2020.
//

import SwiftUI

struct CurrencyView: View {
    
    let currencyValue: Double
    
    var formatedCurrencyValue: String {
        get {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = NumberFormatter.Style.decimal
            guard let formattedNumber = numberFormatter.string(from: NSNumber(value:currencyValue)) else {return "N/A"}
            return formattedNumber
        }
    }
    
    var body: some View {
        HStack {
            Text("\(currencySymbols.dollar.rawValue) \(formatedCurrencyValue)")
                .foregroundColor(.white)
            Spacer()
        }.padding(.horizontal, 15)
    }
}
