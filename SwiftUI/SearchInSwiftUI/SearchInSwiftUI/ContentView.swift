//
//  ContentView.swift
//  SearchInSwiftUI
//
//  Created by Vineet Kumar on 01/10/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchTerm: String = ""
    let names = ["Azam", "Vinee", "There", "Boy"]
    
    var body: some View {
        
        
        List {
            
            SearchBar.init(text: $searchTerm)
            
            ForEach(self.names.filter {
                
                self.searchTerm.isEmpty ? true : $0.localizedCaseInsensitiveContains(self.searchTerm)
                
            }, id: \.self) {
                 name in
                Text(name)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
