//
//  ContentView.swift
//  UserDefaultsInSwiftUI
//
//  Created by Vineet Kumar on 01/10/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var settingsVM = SettingsVM()
    
    var body: some View {

        VStack(alignment: .center, spacing: nil, content: {
        
            Toggle(isOn: $settingsVM.isOn) {
                Text("")
            }.fixedSize()
        }).frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background($settingsVM.isOn.wrappedValue ? Color.green : Color.red)
        .ignoresSafeArea()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
