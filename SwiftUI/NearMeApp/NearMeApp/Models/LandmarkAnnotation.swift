//
//  LandmarkAnnotation.swift
//  NearMeApp
//
//  Created by Vineet Kumar on 06/10/20.
//

import Foundation
import MapKit

final class LandmarkAnnotation: NSObject, MKAnnotation {
    
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(landmark: Landmark) {
        self.title = landmark.title
        self.coordinate = landmark.coordinate
    }
}
