//
//  ContentView.swift
//  PodcastPlayer
//
//  Created by Vineet Kumar on 27/09/20.
//

import SwiftUI

struct ContentView: View {
    
    let episode = Episode.init(name: "Apple", track: "WWDC 2020")
    
    @State private var isPlaying = false
    
    var body: some View {
        
        VStack {
            
            Text(episode.name)
                .font(.title)
                .foregroundColor(self.isPlaying ? .green : .black)
            
            Text(episode.track)
                .foregroundColor(.secondary)
            
            PlayButton(isPlaying: $isPlaying)
            // Passed isPlaying as a bindable property to PlayButton
        }
    }
}

struct PlayButton: View {
    
    @Binding var isPlaying: Bool
    
    var body: some View {
        
        Button(action: {
            // Change bindable property -> Change state -> Body re-renders
            self.isPlaying.toggle()
        }) {
            Text("Play")
        }.padding(16)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
