//
//  ContentView.swift
//  StateObject
//
//  Created by Vineet Kumar on 06/10/20.
//

import SwiftUI

class Counter: ObservableObject {
    @Published var count: Int = 0
}

struct CounterView: View {
    
    @StateObject var counter = Counter() // Keeping the reference of the count with StateObject
    
    var body: some View {
        VStack {
            Text("\(counter.count)")
                .padding()
            Button("Counter value increment") {
                counter.count += 1
            }
        }.padding()
        .background(Color.green)
        
    }
}

struct ContentView: View {
    
    @State var count: Int = 0
    
    var body: some View {
        VStack {
            Text("Content View")
            Text("\(count)")
            Button("Increment ContentView counert") {
                count += 1
            }
            
            CounterView() // Child control
        }.padding()
        .background(Color.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
