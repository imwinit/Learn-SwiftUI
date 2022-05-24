//
//  ContentView.swift
//  CoreImageDetectionWithSwiftUI
//
//  Created by Vineet Kumar on 01/10/20.
//

import SwiftUI

struct ContentView: View {
    
    let images = ["tree","mountain","car"]
    @State private var selectedImage = ""
    
    @ObservedObject private var imageDVM: ImageDetectionVM
    
    init() {
        self.imageDVM = ImageDetectionVM()
    }
    
    var body: some View {
    
        NavigationView {
            
            VStack {
                ScrollView([.horizontal]) {
                    HStack {
                        ForEach(images, id: \.self) { image in
                            Image(image)
                                .resizable()
                                .frame(width: 300, height: 300, alignment: .center)
                                .padding()
                                .onTapGesture(count: 1, perform: {
                                    selectedImage = image
                                })
                                .border(Color.black, width: selectedImage == image ? 10 : 0)
                        }
                    }
                }
                
                Button("Detect") {
                    self.imageDVM.detect(self.selectedImage)
                }.padding()
                .background(Color.green)
                .cornerRadius(10)
                
                Text(self.imageDVM.predictionName)
            }
            
            .navigationBarTitle("Core ML")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
