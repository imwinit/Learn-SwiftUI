//
//  ContentView.swift
//  UnderstandingObservableObject
//
//  Created by Vineet Kumar on 27/09/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var fancyTimer = FancyTimer() // Date receiving from outside source & publishing it to the view
    
    var body: some View {
        Text("\(self.fancyTimer.value)")
            .font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
