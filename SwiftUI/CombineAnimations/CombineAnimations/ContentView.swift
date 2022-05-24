//
//  ContentView.swift
//  CombineAnimations
//
//  Created by Vineet Kumar on 01/10/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var show: Bool = false
    
    var body: some View {
        
        VStack {
            
            Spacer()
            Text("🐱").font(.custom("Arial", size: 100))
                .scaleEffect(show ? 2 : 1)
                .rotationEffect(.degrees(show ? 360 : 0))
            animation(.interpolatingSpring(mass: 1, stiffness: 100, damping: 10, initialVelocity: 0))
            
            Spacer()
            
            Button("Press me") {
                show.toggle()
            }.padding()
            .background(Color.green)
            .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
