//
//  ContentView.swift
//  CryptoStocks
//
//  Created by Emin Bari on 17.08.2020.
//

import SwiftUI

struct ContentView: View {
    let points: [Double] = [1, 2, 3, 4, 3, 1, 3, 5, 6, 3, 2]
    
    var path: Path {
        return Path.lineChart(points: points, step: CGPoint(x: 10.0, y: 10.0))
    }
    var body: some View {
        
        VStack {
            self.path
                .stroke(Color.green ,style: StrokeStyle(lineWidth: 3, lineJoin: .round))
                .rotationEffect(.degrees(180), anchor: .center)
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                .drawingGroup()
        }
        .frame(width: 200, height: 100)
        .background(Color.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
