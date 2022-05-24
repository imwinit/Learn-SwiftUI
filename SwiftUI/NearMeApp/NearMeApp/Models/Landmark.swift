//
//  Landmark.swift
//  NearMeApp
//
//  Created by Vineet Kumar on 06/10/20.
//

import Foundation
import MapKit

struct Landmark {
    
    let placemark: MKPlacemark
    
    var id: UUID {
        return UUID()
    }
    
    var name: String {
        self.placemark.name ?? ""
    }
    
    var title: String {
        self.placemark.title ?? ""
    }
    
    var coordinate: CLLocationCoordinate2D {
        return self.placemark.coordinate
    }
}
