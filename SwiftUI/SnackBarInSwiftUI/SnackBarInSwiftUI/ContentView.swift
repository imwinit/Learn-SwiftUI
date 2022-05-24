//
//  ContentView.swift
//  SnackBarInSwiftUI
//
//  Created by Vineet Kumar on 01/10/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var isShown: Bool = false
    
    var body: some View {
        
        VStack {
            SnackBar().offset(x: 0, y: isShown ?  -UIScreen.main.bounds.height/3 : -UIScreen.main.bounds.height)
                .animation(.interpolatingSpring(mass: 1.0, stiffness: 100.0, damping: 10, initialVelocity: 0))
            
            Button("Press me") {
                isShown.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SnackBar: View {
    
    var body: some View {
        
        Text("New")
            .frame(width: UIScreen.main.bounds.width - 20, height: 70, alignment: .center)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}
