//
//  FancyTimer.swift
//  UnderstandingObservableObject
//
//  Created by Vineet Kumar on 27/09/20.
//

import Foundation

class FancyTimer : ObservableObject {
    
    @Published var value : Int = 0 // Publishes the value to the subscribers every time it changes
    
    init() {
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.value += 1 // Value changes
        }
    }
}
