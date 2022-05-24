//
//  DishCell.swift
//  XcodePreviews
//
//  Created by Vineet Kumar on 28/09/20.
//

import SwiftUI

struct DishCell: View {
    
    let dish: Dish
    
    var body: some View {
        
        HStack {
            
            Image(dish.image)
            .resizable()
            .frame(width: 100, height: 100, alignment: .center)
            .clipShape(Circle())
    
        VStack(alignment: .center, spacing: nil, content: {
            Text(dish.name)
            Text("\(dish.price)")
        })
            
        }.padding(5)
    }
}

struct DishCell_Previews: PreviewProvider {
    static var previews: some View {
        
//        ForEach(ContentSizeCategory.allCases, id: \.self) { contentSize in
            
        DishCell(dish: Dish.all().first!)
                .previewLayout(.sizeThatFits)
//                .environment(\.sizeCategory, contentSize)
//                .colorScheme(.dark) // Bug have to embed everything inside NavigationView to see dark mode
                .previewDevice("iPhone 8")
//        }

        // Use Group if cannot iterate for multiple previews
    }
}
