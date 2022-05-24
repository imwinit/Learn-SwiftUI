//
//  ContentView.swift
//  NearMeApp
//
//  Created by Vineet Kumar on 06/10/20.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    private var locationManager = LocationManager()
    @State private var search: String = ""
    @State private var landmarks: [Landmark] = []
    @State private var tapped: Bool = false
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            MapView(landmarks: self.landmarks)
            
            TextField("Search", text: $search, onEditingChanged: { _ in }) {
                getNearbyLandmarks()
            }.textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .offset(y: 44)
            
            PlaceListView(landmarks: landmarks, onTap: {
                
                self.tapped.toggle()
            })
            .animation(.spring())
            .offset(y: calculateOffset())
        }
    }
    
    private func getNearbyLandmarks() {
        
        guard let location = self.locationManager.location else {
            return
        }
        
        let req = MKLocalSearch.Request()
        req.naturalLanguageQuery = search
        req.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        
        let search = MKLocalSearch(request: req)
        search.start { (response, error) in
            
            guard let response = response, error == nil else {
                return
            }
            
            let mapItems = response.mapItems
            self.landmarks = mapItems.map {
                Landmark(placemark: $0.placemark)
            }
        }
    }
    
    func calculateOffset() -> CGFloat {
        
        if landmarks.count > 0 && !self.tapped {
            return UIScreen.main.bounds.height - UIScreen.main.bounds.height / 4
        } else if self.tapped {
            return 100
        } else {
            return UIScreen.main.bounds.height
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
