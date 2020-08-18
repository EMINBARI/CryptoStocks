//
//  WidgetModel.swift
//  CryptoStocks
//
//  Created by Emin Bari on 17.08.2020.
//

import WidgetKit
import SwiftUI

struct WidgetDataModel: TimelineEntry {
    let date: Date
    let changePercent: Double
    let usd: Double
    static var dynamics: [Double] = [0.7, 0.9, 0.7, 0.6, 0.4, 0.9, 0.8, -0.5, -0.8, -0.9, -0.7, -0.8, -0.5, -0.4, -0.1, 0.4]
}
