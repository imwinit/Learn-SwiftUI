//
//  URLImage.swift
//  XcodePreviewForUIKit
//
//  Created by Vineet Kumar on 29/09/20.
//

import SwiftUI

struct URLImage: View {
    
    let url: String
    let placeholder: String
    
    @ObservedObject var imageLoader = ImageLoader()
    
    init(url: String, placeholder: String = "placeholder") {
        self.url = url
        self.placeholder = placeholder
        self.imageLoader.load(url: self.url)
    }
    
    var body: some View {
        
        if let image = imageLoader.downloadedImage {
            Image(uiImage: image)
                .resizable()
        } else {
            Image("placeholder").resizable()
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "https://fyrafix.files.wordpress.com/2011/08/url-8.jpg")
    }
}
