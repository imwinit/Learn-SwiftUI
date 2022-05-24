//
//  ContentView.swift
//  FlagsOfTheWorld
//
//  Created by Vineet Kumar on 29/09/20.
//

import SwiftUI

struct ContentView: View {
    
    let flags = [ "🇯🇵", "🇰🇷", "🇩🇪", "🇨🇳", "🇺🇸", "🇫🇷", "🇪🇸", "🇮🇹", "🇷🇺", "🇬🇧"]
    // fn + contrl + cmd + space -> emojis
    @State private var flagVM = FlagVM()
    
    var body: some View {
        
        List {
            
            Text(self.flagVM.country)
            
            ForEach(self.flags, id: \.self) { flag in
                
                HStack {
                    Text(flag)
                        .font(.custom("Arial", size: 100))
                    Spacer()
                }.onTapGesture {
                    self.flagVM.flag = flag
                    self.flagVM.showModal.toggle()
                }
            }
            
        }.sheet(isPresented: $flagVM.showModal, content: {
            FlagDetailView(flagVM: $flagVM)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
