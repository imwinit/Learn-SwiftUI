//
//  DishesTableVCPreview.swift
//  XcodePreviewForUIKit
//
//  Created by Vineet Kumar on 28/09/20.
//

import Foundation
import SwiftUI

struct DishesTableVCPreview: PreviewProvider, UIViewControllerRepresentable {
    
    // Methods of UIViewControllerRepresentable protocol
    func makeUIViewController(context: Context) -> DishesTableVC {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: "DishesTableVC")
    }
    
    func updateUIViewController(_ uiViewController: DishesTableVC, context: Context) {
        
    }

    typealias UIViewControllerType = DishesTableVC
    //
    
    // Method of PreviewProvider
    static var previews: some View {
        DishesTableVCPreview() // Pass preview made
    }
}
