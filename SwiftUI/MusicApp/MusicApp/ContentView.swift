//
//  ContentView.swift
//  MusicApp
//
//  Created by Vineet Kumar on 06/10/20.
//

import SwiftUI

struct MusicPlayerBar: View {
    
    let namespace: Namespace.ID
    
    var body: some View {
        HStack {
            Image("tree")
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
                .cornerRadius(4.0)
                .padding()
                .matchedGeometryEffect(id: "animation", in: namespace)
            
            Text("Baby blue")
                .font(.headline)
            
            Spacer()
            
            Image(systemName: "play.fill")
            Image(systemName: "forward.fill")
                .padding()
        }
        .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 60, maxHeight: 60, alignment: .center)
        .background(Color.gray)
    }
}

struct MusicPlayer: View {
    
    let namespace: Namespace.ID
    
    var body: some View {
        VStack {
            Image("tree")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .padding(40)
                .matchedGeometryEffect(id: "animation", in: namespace)
            
            HStack {
                VStack(alignment: .leading, spacing: nil, content: {
                    
                    Text("Baby blue")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Badfinger")
                        .font(.title)
                        .fontWeight(.light)
                        .opacity(0.5)
                        .foregroundColor(.white)
                }).padding()
                
                Spacer()
            }
            
            HStack {
                
                Image(systemName: "backward.fill")
                    .foregroundColor(.white)
                    .font(.system(size:30))
                Image(systemName: "play.fill")
                    .foregroundColor(.white)
                    .font(.system(size:30))
                    .padding([.leading, .trailing], 75)
                Image(systemName: "forward.fill")
                    .foregroundColor(.white)
                    .font(.system(size:30))
                    
            }
            
            Spacer()
            
        }.frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .center)
        .background(Color.red)
    }
}


struct ContentView: View {
    
    @Namespace private var ns
    @State private var showDetails = false
    
    var body: some View {
        VStack {
            Spacer()
            if showDetails {
                MusicPlayer(namespace: ns)
            } else {
                MusicPlayerBar(namespace: ns)
            }
        }.onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
            withAnimation(.spring()) {
                showDetails.toggle()
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
