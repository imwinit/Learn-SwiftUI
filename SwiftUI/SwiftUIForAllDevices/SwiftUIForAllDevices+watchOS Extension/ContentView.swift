//
//  ContentView.swift
//  SwiftUIForAllDevices+watchOS Extension
//
//  Created by Vineet Kumar on 01/10/20.
//

import SwiftUI

struct ContentView: View {
    
    private var animals = AnimalService.getAll()
    
    var body: some View {
    
        // No NavigationView in watchOS
        
        List {
            
            ForEach(self.animals, id: \.name) { animal in
                NavigationLink(destination: SharedDetailView(animal: animal)) {
                    AnimalCell(animal: animal)
                }
            }
        }.listStyle(CarouselListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AnimalCell: View {
    
    let animal: Animal
    
    var body: some View {
        VStack(alignment: .center, spacing: nil, content: {
            
            Text(animal.image)
                .font(.custom("Arial", size: 100))
            Text(animal.name)
            
        }).frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 100, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
