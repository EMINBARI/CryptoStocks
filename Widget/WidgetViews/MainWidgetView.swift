//
//  MainWidgetView.swift
//  CryptoStocks
//
//  Created by Emin Bari on 17.08.2020.
//

import SwiftUI

struct MainWidgetView: View {
    var data: DataProvider.Entry
    
    let padding: CGFloat = 10
    let space: CGFloat = 40
    
    var body: some View {
        ZStack {
            Rectangle().fill(Color.black)
            GeometryReader { geo in
                ZStack {
                    VStack {
                        HeaderView(changePercentValue: data.changePercent)
                        Spacer()
                        CurrencyView(currencyValue: data.usd)
                    }.zIndex(1)
                    
                    //MARK:- Line chart
                    LineChartView(
                        data: DataProvider.Entry.dynamics,
                        frame: .constant(CGRect(x: 0,
                                                y: 0,
                                                width: geo.frame(in: .local).size.width,
                                                height: geo.frame(in: .local).size.height - space)
                        )
                    )//Line
                }.padding(padding)
            }
        }//ZStack
    }//View
}//MainWidgetView

struct MainWidgetView_Previews: PreviewProvider {
    var data: DataProvider.Entry
    static var previews: some View {
        VStack {
            MainWidgetView(
                data: DataProvider.Entry.init(
                    date: Date(),
                    changePercent: 0.0,
                    usd: 110.0)
            )
        }.frame(width:200, height:200)
    }
}
