//
//  ContentView.swift
//  BarGraph
//
//  Created by Vineet Kumar on 29/09/20.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        BarGraph(reports: Report.all())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
