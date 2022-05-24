//
//  ContentView.swift
//  NotificationForm
//
//  Created by Vineet Kumar on 29/09/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section(header: Text("")) {
                    
                    HStack {
                        
                        Text("Show Previews")
                        Spacer()
                        NavigationLink(destination: Text("")) {
                            Text("Always").foregroundColor(.gray)
                        }.fixedSize()
                        
                    }
                    
                }
                
                Section(header: Text("Notifation Notifation Notifation Notifation Notifation Notifation Notifation").foregroundColor(.gray).padding(10).lineLimit(nil)) {
                    
                    NavigationLink(destination: Text("")) {
                        Text("Siri Suggestions")
                    }
                    
                }
                
                Section(header:
                
                            VStack(alignment: .leading) {
                                Text("Notif Notif Notif Notif Notif Notif Notif Notif Notif").lineLimit(nil).padding(2)
                                Text("Notif Notif Notif").padding(2)
                            }
                
                ) {
                    
                    ForEach(1..<10) { index in
                        Text("\(index)")
                    }
    
                }
                
            }.navigationBarTitle("Notifications", displayMode: .inline)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
