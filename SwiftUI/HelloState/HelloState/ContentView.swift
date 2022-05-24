//
//  ContentView.swift
//  HelloState
//
//  Created by Vineet Kumar on 27/09/20.
//

import SwiftUI

struct ContentView: View {
    
    // When we change the state it renders the body again
    // Body needs to be in sync with the State
    @State var name: String = "Vineet"
    
    var body: some View {
        VStack {
            Text(name)
                .font(.largeTitle)
                .padding()
            Button(action: {
                name = "Manish"
            }) {
                Text("Change Name")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
