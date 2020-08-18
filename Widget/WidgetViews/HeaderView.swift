//
//  HeaderView.swift
//  CryptoStocks
//
//  Created by Emin Bari on 17.08.2020.
//

import SwiftUI

struct DynamicsImage {
    let color: Color
    let symbol: sfImage
}

struct HeaderView: View {
    
    let changePercentValue: Double
    
    private let count = WidgetDataModel.dynamics.count
    
    private var dynamicsImage : DynamicsImage {
        get {
            if !WidgetDataModel.dynamics.isEmpty && count >= 2 {
                let penultimateElement = WidgetDataModel.dynamics[count - 2]
                let distinction = WidgetDataModel.dynamics.last! - penultimateElement
                if distinction > 0 {
                    return DynamicsImage.init(color: .green, symbol: sfImage.up)
                } else {
                    return DynamicsImage.init(color: .red, symbol: sfImage.down)
                }
            }
            return DynamicsImage.init(color: .white, symbol: sfImage.bitcoin)
        }
    }
    
    //MARK:- UI properties
    private let horizontalPadding: CGFloat = 0.0
    private let bottomPadding: CGFloat = 0.0
    private let textColor: Color = .white
    
    private let cryptoCurrencyName: String = "BTC/USD"
    
    var body: some View {
        HStack {
            Text(cryptoCurrencyName)
                .foregroundColor(textColor)
                .font(.title2)
                .bold()
            Spacer()
            Image(systemName: dynamicsImage.symbol.rawValue)
                .foregroundColor(dynamicsImage.color)
                .font(.body)
            
            Text("\(String(format:"%.2f", changePercentValue))%")
                .foregroundColor(textColor)
        }
        .padding(.horizontal, 15)
        .padding(.top, 5)
        Path()
    }
}
