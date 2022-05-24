//
//  ContentView.swift
//  SectionsInCombine
//
//  Created by Vineet Kumar on 01/10/20.
//

import SwiftUI

struct ContentView: View {
    
    var array = [["1","2"],["3","4"]]
    
    var body: some View {
        
        List {
            
            ForEach(array, id: \.self) { item in
                
                Section.init(header: Text("Count")) {
                    
                    ForEach(item, id: \.self) { item in
                        
                        Text("\(item)")
                    }
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
