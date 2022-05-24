//
//  ContentView.swift
//  SwiftUIBasicAnimation
//
//  Created by Vineet Kumar on 01/10/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showDetail: Bool = false
    
    var body: some View {
        
        VStack {
            
            Button("Press me") {
                self.showDetail.toggle()
            }
            
            HStack {
                
                Text(self.showDetail ? "Hide Detail" : "Show Detail")
                Image(systemName: "chevron.up.square")
                    .rotationEffect(.degrees(self.showDetail ? 0 : 180))
                    .animation(.default)
            }
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
