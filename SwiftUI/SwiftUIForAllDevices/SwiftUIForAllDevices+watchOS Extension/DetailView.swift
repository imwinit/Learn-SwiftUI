//
//  DeviceDetail.swift
//  SwiftUIForAllDevices+watchOS Extension
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

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(animal: AnimalService.getAll().first!)
    }
}
