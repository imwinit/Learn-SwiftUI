//
//  ContentView.swift
//  AppStorage
//
//  Created by Vineet Kumar on 06/10/20.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isDarkMode") // Stores inside UserDefault
    private var isDarkMode: Bool = false
    
    var body: some View {
        
        VStack {
            Text(isDarkMode ? "DARK" : "LIGHT")
            
            Toggle(isOn: $isDarkMode) {
                Text("Select mode")
            }.fixedSize()

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
