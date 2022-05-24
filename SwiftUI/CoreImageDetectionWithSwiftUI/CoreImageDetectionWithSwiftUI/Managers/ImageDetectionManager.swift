//
//  ImageDetectionManager.swift
//  CoreImageDetectionWithSwiftUI
//
//  Created by Vineet Kumar on 01/10/20.
//

import Foundation
import CoreML
import UIKit

class ImageDetectionManager {
    
    let model = Resnet50()
    
    func detect(_ image: UIImage) -> String? {
        
        guard let pixelBuffer = image.pixelBuffer(), let prediction = try? model.prediction(image: pixelBuffer) else {
            return nil
        }
        
        return prediction.classLabel
    }
}
