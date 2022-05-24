//
//  Card.swift
//  Gestures
//
//  Created by Vineet Kumar on 29/09/20.
//

import SwiftUI

struct Card: View {
    
    let tapped: Bool
    @State private var scale: CGFloat = 1
    
    var body: some View {
        
        VStack {
            
            Image("idli")
                .resizable()
                .scaleEffect(self.scale)
                .frame(width: 300, height: 300, alignment: .center)
                .gesture(MagnificationGesture()
                    .onChanged({ (value) in
                        self.scale = value.magnitude
                    })
                )
            
            Text("Card")
                .font(.title)
                .foregroundColor(.white)
        }
        .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .center)
        .background(self.tapped ? Color.purple : Color.orange)
        .cornerRadius(30)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(tapped: false)
    }
}
