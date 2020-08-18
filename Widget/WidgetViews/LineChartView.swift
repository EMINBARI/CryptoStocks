//
//  Line.swift
//  CryptoStocks
//
//  Created by Emin Bari on 17.08.2020.
//
import SwiftUI

struct LineChartView: View {
    var data: [(Double)]
    @Binding var frame: CGRect

    let padding: CGFloat = 10
    
    var stepWidth: CGFloat {
        if data.count < 2 {
            return 0
        }
        return (frame.size.width - 3 * padding) / CGFloat(data.count - 1)
    }
    
    var stepHeight: CGFloat {
        var min: Double?
        var max: Double?
        let points = self.data
        
        if let minPoint = points.min(), let maxPoint = points.max(), minPoint != maxPoint {
            min = minPoint
            max = maxPoint
        }else {
            return 0
        }
        
        if let min = min, let max = max, min != max {
            if (min <= 0) {
                return (frame.size.height - 3*padding) / CGFloat(max - min)
            }else {
                return (frame.size.height - 3*padding) / CGFloat(max + min)
            }
        }
        
        return 0
    }
    
    var path: Path {
        let points = self.data
        print(stepHeight)
        return Path.lineChart(points: points, step: CGPoint(x: stepWidth, y: stepHeight))
    }
    
    public var body: some View {
        
        self.path
            .stroke(
                Color.green,
                style: StrokeStyle(
                    lineWidth: 2,
                    lineJoin: .round))
            .rotationEffect(.degrees(180), anchor: .center)
            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            .drawingGroup()
            .blur(radius: 0.1)
    }//View
}
