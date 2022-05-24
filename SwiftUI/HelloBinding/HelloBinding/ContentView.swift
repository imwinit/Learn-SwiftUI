//
//  ContentView.swift
//  HelloBinding
//
//  Created by Vineet Kumar on 27/09/20.
//

import SwiftUI

// Binding
// Undirectional
// View -> VM
// VM -> View
// Bidirectional
// View <-> VM

struct ContentView: View {
    
    @State var name: String = ""
    
    private func printName() {
        print(self.name)
    }
    
    var body: some View {
        VStack {
            Text(name)
            TextField("Enter name", text: $name)
                .padding(20)
            
            Button(action: printName) {
                Text("Show name value")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
