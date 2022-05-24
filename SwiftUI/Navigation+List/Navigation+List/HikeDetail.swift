//
//  HikeDetailVC.swift
//  Navigation+List
//
//  Created by Vineet Kumar on 27/09/20.
//

import SwiftUI

struct HikeDetail: View {
    
    let hike: Hike
    @State private var zoomed: Bool = false
    
    var body: some View {
        VStack {
            Image(hike.image)
                .resizable()
                .aspectRatio(contentMode: self.zoomed ? .fill : .fit)
                .onTapGesture(perform: {
                    withAnimation {
                        self.zoomed.toggle()
                    }
                })
                
            Text(hike.name)
                .font(.title)
            Text(String(format: "%.2f", hike.miles))
        }
        .navigationBarTitle(hike.name, displayMode: .inline)
    }
}

struct HikeDetail_Previews: PreviewProvider {
    static var previews: some View {
        HikeDetail(hike: Hike(id: 0, name: "BirBilling", image: "bir", miles: 10))
    }
}
