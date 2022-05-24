//
//  BarGraph.swift
//  BarGraph
//
//  Created by Vineet Kumar on 29/09/20.
//

import SwiftUI

struct BarGraph: View {
    
    let reports: [Report]
    
    var body: some View {
        
        VStack {
            
            HStack(alignment: .lastTextBaseline, spacing: nil, content: {
                
                ForEach(self.reports, id: \.year) { report in
                    
                    BarView(report: report)
                }
            })
        }
    }
}

struct BarGraph_Previews: PreviewProvider {
    static var previews: some View {
        BarGraph(reports: Report.all())
    }
}

struct BarView: View{
    
    let report: Report
    @State private var showGraph: Bool = false
    
    var body: some View {
        
        let value = report.revenue / 10
        let yValue = Swift.min(value * 20, 500)
        
        return VStack {
            
            Text(String(format: "%.2f", report.revenue))
            
            Rectangle()
                .fill(Color.red)
                .frame(width: 100, height: self.showGraph ? CGFloat(yValue) : 0, alignment: .center)
                
                .onAppear {
                    withAnimation(.spring()) {
                        self.showGraph = true
                    }
                }
            
            Text(report.year)
        }
    }
}
