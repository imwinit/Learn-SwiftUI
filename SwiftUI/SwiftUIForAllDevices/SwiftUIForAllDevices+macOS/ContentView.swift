//
//  ContentView.swift
//  SwiftUIForAllDevices+macOS
//
//  Created by Vineet Kumar on 01/10/20.
//

import SwiftUI

struct DetailView: View {
    
    let animal: Animal
    
    var body: some View {
        
        VStack {
            Text(animal.image)
                .font(.custom("Arial", size: 100))
            Text(animal.name)
            Text(animal.desc)
            
        }
    }
    
}

struct AnimalList: View {

    @Binding var selectedAnimal: Animal?
    
    let animals = AnimalService.getAll()
    
    var body: some View {
        
        List(self.animals, id: \.self) {
            animal in
            
            VStack {
                Text(animal.image)
                    .font(.custom("Arial", size: 100))
                Text(animal.name)
            }.onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                self.selectedAnimal = animal
            })
        }
    }
}

struct ContentView: View {
    
    @State private var selectedAnimal: Animal? = nil
    
    var body: some View {
        
        NavigationView {
            
            GeometryReader { g in
                AnimalList(selectedAnimal: $selectedAnimal)
            }
            
            GeometryReader { g -> SharedDetailView in
                if let animal = self.selectedAnimal {
                    return SharedDetailView(animal: animal)
                } else {
                    return SharedDetailView(animal: Animal.placeholder)
                }
            }
    
                .navigationViewStyle(DoubleColumnNavigationViewStyle())
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
