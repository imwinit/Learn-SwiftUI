//
//  ImageLoader.swift
//  XcodePreviewForUIKit
//
//  Created by Vineet Kumar on 29/09/20.
//

import Foundation
import UIKit
import Combine

class ImageLoader: ObservableObject {
    
    @Published var downloadedImage: UIImage?
//    let didChange = PassthroughSubject<ImageLoader?, Never>()
    
    func load(url: String) {
        
        guard let imageUrl = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self.downloadedImage = nil
                }
                return
            }
            
            let img = UIImage(data: data)
            DispatchQueue.main.async {
                self.downloadedImage = img
            }
            
        }.resume()
    }
}
