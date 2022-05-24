//
//  ContentView.swift
//  Redacted
//
//  Created by Vineet Kumar on 06/10/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isRedacted = false
    
    var body: some View {
        VStack(spacing: 10) {
            Toggle(isOn: $isRedacted, label: {
                Text("Redacted")
            })
            Spacer()
            Text("Vineet")
            HStack {
                Text("SSN")
                Text("123-45-323")
                    .redacted(reason: isRedacted ? .placeholder : .init())
            }
            Spacer()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
