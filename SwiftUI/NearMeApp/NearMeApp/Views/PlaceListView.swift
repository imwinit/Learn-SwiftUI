//
//  PlaceListView.swift
//  NearMeApp
//
//  Created by Vineet Kumar on 06/10/20.
//

import SwiftUI
import MapKit

struct PlaceListView: View {
    
    let landmarks: [Landmark]
    var onTap: () -> ()
    
    var body: some View {
        
        VStack {
            
            HStack {
                EmptyView()
            }.frame(width: UIScreen.main.bounds.width, height: 60, alignment: .center)
            .background(Color.blue)
            .gesture(TapGesture()
                        .onEnded(self.onTap))
            
            List(self.landmarks, id: \.id) { landmark in
                Text(landmark.name)
            }.animation(nil)
        }.cornerRadius(10)
    }
}

struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceListView(landmarks: [Landmark.init(placemark: MKPlacemark())], onTap: {})
    }
}
