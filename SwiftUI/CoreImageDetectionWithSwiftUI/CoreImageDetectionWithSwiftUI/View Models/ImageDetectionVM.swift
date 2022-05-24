//
//  ImageDetectionVM.swift
//  CoreImageDetectionWithSwiftUI
//
//  Created by Vineet Kumar on 01/10/20.
//

import Foundation
import SwiftUI
import Combine

class ImageDetectionVM: ObservableObject {
    
    var name: String = ""
    var manager = ImageDetectionManager()
    
    @Published var predictionName: String = ""
    
    func detect(_ name: String) {
        
        // resize
        let sourceImage = UIImage(named: name)
        
        guard let resizedImage = sourceImage?.resizeImage(tagretSize: CGSize.init(width: 224, height: 224)) else {
            return
        }
        
        // detect
        if let predictionName = self.manager.detect(resizedImage) {
            self.predictionName = predictionName
        }
    }
}
