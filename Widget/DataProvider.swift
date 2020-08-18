//
//  DataProvider.swift
//  CryptoStocks
//
//  Created by Emin Bari on 17.08.2020.
//

import Foundation
import WidgetKit
import SwiftUI

struct DataProvider: TimelineProvider {
    
    private func appendDynamics(_ newValue: Double) {
        let maxElementsCount = 24
        
        guard let lastElementValue = WidgetDataModel.dynamics.last else { return  }
        
        let roundedLast = Double(round(100 * lastElementValue)/100)
        let roundedNew = Double(round(100 * newValue)/100)
        
        let difference = abs(newValue - lastElementValue)
        
        if difference > 0.1 {
            if WidgetDataModel.dynamics.count < maxElementsCount {
                if (roundedLast != roundedNew) {
                    WidgetDataModel.dynamics.append(roundedNew)
                }
            } else {
                if roundedLast != roundedNew {
                    WidgetDataModel.dynamics.remove(at: 0)
                    WidgetDataModel.dynamics.append(roundedNew)
                }
            }
        }
        print("appended", WidgetDataModel.dynamics)
    }
        
    func timeline(with context: Context, completion: @escaping (Timeline<WidgetDataModel>) -> ()) {
        let date = Date()
        let cryptoLoader = CryptoLoader()
        
        cryptoLoader.load { result in
            let cryptoData: CryptoCurrencyData
            if case .success(let fetchedData) = result {
                cryptoData = fetchedData
                
                let changePercent = cryptoData.raw.btc.eur.changepct24Hour
                let usdPrice = cryptoData.raw.btc.usd.price
                
                appendDynamics(changePercent)
                
                let data = WidgetDataModel(
                    date: date,
                    changePercent: changePercent,
                    usd: usdPrice)
                
                //MARK:- Widget timeline updating
                let updateValue: Int = 1
                let timePeriod = Calendar.Component.minute
                let refreshDate = Calendar.current.date(byAdding: timePeriod, value: updateValue, to: date)!
                let timeLine = Timeline(entries: [data], policy: .after(refreshDate))
                
                completion(timeLine)
            }
        }
    }

    //MARK:- Fake widget data for overview in widget panel
    func snapshot(with context: Context, completion: @escaping (WidgetDataModel) -> ()) {
        let date = Date()
        
        let data = WidgetDataModel(
            date: date,
            changePercent: 0.0,
            usd: 100.0)
        
        completion(data)
    }
}
