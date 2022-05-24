//
//  ContentView.swift
//  NeumorphicButton
//
//  Created by Vineet Kumar on 06/10/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            NeumorphicImageButton(systemName: "heart.fill", onTap: {
                
            })
        }.frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .center)
        .background(Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)))
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
