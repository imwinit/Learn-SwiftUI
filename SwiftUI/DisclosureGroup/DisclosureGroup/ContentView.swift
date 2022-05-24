//
//  ContentView.swift
//  DisclosureGroup
//
//  Created by Vineet Kumar on 06/10/20.
//

import SwiftUI

struct ContentView: View {

    @State var animalsExpanded: Bool = true
    let animals = ["🐱", "🐹", "🐮"]

    var body: some View {

        Form {
            
            DisclosureGroup(
                isExpanded: $animalsExpanded,
                content: {
                    
                    ForEach (animals, id: \.self) { animal in
                        Text(animal)
                            .font(.system(size: 50))
                    }
                },
                label: { Text("Label") }
            )
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
