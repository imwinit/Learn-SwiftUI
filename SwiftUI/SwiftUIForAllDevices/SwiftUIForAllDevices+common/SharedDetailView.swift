//
//  SharedDetailView.swift
//  SwiftUIForAllDevices
//
//  Created by Vineet Kumar on 01/10/20.
//

import SwiftUI

struct SharedDetailView: View {
    
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

struct SharedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SharedDetailView(animal: AnimalService.getAll().first!)
    }
}
