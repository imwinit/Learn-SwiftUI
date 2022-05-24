//
//  ContentView.swift
//  Hello-SwiftUI
//
//  Created by Vineet Kumar on 27/09/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack(alignment: .center, spacing: nil, content: {
            
            Image("new")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(50)
                .padding(.all)
 //               .clipShape(Circle())
            
            Text("Hello, Swift UI!")
                .font(.largeTitle)
                .foregroundColor(.green)

            Text("Two Liner")
                .font(.title)
                .foregroundColor(.orange)
            
            HStack {
                Text("Left")
                Text("Right")
                    .padding(.all)
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
