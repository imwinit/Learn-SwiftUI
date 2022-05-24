//
//  ContentView.swift
//  SwiftUIRating
//
//  Created by Vineet Kumar on 01/10/20.
//

import SwiftUI

extension Image {
    
    func resizedToFill(width: CGFloat, height: CGFloat) -> some View {
        self.resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: height, alignment: .center)
    }
}

struct ContentView: View {
    
    @State private var rating: Int?
    
    var body: some View {
        VStack {
            
            Image("tree")
                .resizedToFill(width: 150, height: 150)
            
            RatingView(rating: $rating).padding()
            Text(rating != nil ? "Your rating: \(rating!)" : "")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
