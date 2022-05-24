//
//  ContentView.swift
//  ImageLoader
//
//  Created by Vineet Kumar on 29/09/20.
//

import SwiftUI

struct ContentView: View {
    
    let images = ["https://api.time.com/wp-content/uploads/2014/07/301386_full1.jpg?w=800&quality=85",
        "https://api.time.com/wp-content/uploads/2014/07/301386_full1.jpg?w=800&quality=85",
        "https://api.time.com/wp-content/uploads/2014/07/301386_full1.jpg?w=800&quality=85"
    ]
    
    var body: some View {
        
        List {
            
            ForEach(self.images, id: \.self) { image in
                URLImage(url: image)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
