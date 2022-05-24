//
//  ContentView.swift
//  Gestures
//
//  Created by Vineet Kumar on 29/09/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tapped: Bool = false
    @State private var cardDragState = CGSize.zero
    @State private var cardRotateState = Double.zero
    
    var body: some View {
        Card(tapped: self.tapped)
            .animation(.spring())
            .offset(y: self.cardDragState.height)
            .rotationEffect(Angle(degrees: self.cardRotateState))
            .gesture(DragGesture()
                        .onChanged({ (value) in
                            self.cardDragState = value.translation
                            
                        })
                     
                        .onEnded({ (value) in
                            self.cardDragState = .zero
                        })
            )
            
            .gesture(TapGesture(count: 1)
                        .onEnded({
                            self.tapped.toggle()
                        })
            )
        
            .gesture(RotationGesture()
                        .onChanged({ (angle) in
                            self.cardRotateState = angle.degrees
                        })
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
