//
//  ContentView.swift
//  AnotherExampleObservableObject
//
//  Created by Vineet Kumar on 28/09/20.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var settings: UserSettings // Global object shared between other views eg. auth token, user settings
    // Eg Redux in React
    
    var body: some View {
        VStack {
            Text("\(settings.score)")
                .font(.title)
            Button("Increment Score") {
                settings.score += 1
            }
            // Need of environment object cause had to use binding then & pass score to fancy score view
            // This will be difficult if we have deep hierarchy of views
            FancyScoreView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserSettings()) // Inject environment object here too
    }
}
