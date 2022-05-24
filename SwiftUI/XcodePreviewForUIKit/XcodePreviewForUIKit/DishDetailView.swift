//
//  DishDetailView.swift
//  XcodePreviewForUIKit
//
//  Created by Vineet Kumar on 28/09/20.
//

import SwiftUI

struct DishDetailView: View {
    
    @State private var selected = false
    
    let dish: Dish
    
    var body: some View {
        
        VStack {
            
            HStack {
                Spacer()
                StarViewRepresentation(selected: $selected)
                    .frame(width: 35, height: 35, alignment: .center)
            }
    
            Text(dish.name).padding()
        }
    }
}

struct DishDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DishDetailView(dish: Dish.all().first!)
    }
}
