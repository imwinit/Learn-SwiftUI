//
//  ContentView.swift
//  CapturePhotoSwiftUI
//
//  Created by Vineet Kumar on 01/10/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showImagePicker : Bool = false
    @State private var image : Image? = nil
    
    var body: some View {
    
        VStack {
            
            image?.resizable()
                .scaledToFit()
            
            Button("Open camera") {
                self.showImagePicker = true
            }
        }.sheet(isPresented: $showImagePicker) {
            PhotoCaptureView(showImagePicker: $showImagePicker, image: $image)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
