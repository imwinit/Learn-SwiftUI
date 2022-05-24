//
//  FooView.swift
//  HelloGeometryObject
//
//  Created by Vineet Kumar on 06/10/20.
//

import SwiftUI

struct FooView: View {
    
    @State private var isSwitched = false
    @Namespace private var ns
    
    var body: some View {
        HStack {
            
            if !isSwitched {
                Circle()
                    .fill(Color.red)
                    .frame(width: 50, height: 50, alignment: .center)
                    .matchedGeometryEffect(id: "animation", in: ns)
            }
            
            Spacer()
            
            Button("Switch") {
                withAnimation {
                    isSwitched.toggle()
                }
            }
            
            Spacer()
            
            VStack {
                
                Circle()
                    .fill(Color.red)
                    .frame(width: 50, height: 50, alignment: .center)
                
                
                if isSwitched {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 150, height: 150, alignment: .center)
                        .matchedGeometryEffect(id: "animation", in: ns)
                }
                
                Circle()
                    .fill(Color.red)
                    .frame(width: 50, height: 50, alignment: .center)
            }
            
            
        }
    }
}

struct FooView_Previews: PreviewProvider {
    static var previews: some View {
        FooView()
    }
}
