//
//  FancyScoreView.swift
//  AnotherExampleObservableObject
//
//  Created by Vineet Kumar on 28/09/20.
//

import SwiftUI

struct FancyScoreView: View {
    
    @EnvironmentObject var userSettings: UserSettings
    
    var body: some View {
        VStack {
            Text("\(userSettings.score)")
            Button("Increment Score") {
                self.userSettings.score += 1
            }.padding()
            .background(Color.green)
        }.padding()
        .background(Color.orange)
    }
}

struct FancyScoreView_Previews: PreviewProvider {
    static var previews: some View {
        FancyScoreView()
    }
}
