//
//  ContentView.swift
//  NightShiftForm
//
//  Created by Vineet Kumar on 29/09/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var scheduled: Bool = false
    @State private var manuallyEnabledTillTomorrow: Bool = false
    @State private var colorTemperature: CGFloat = 0.5
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section(header: Text("Night shift Night shift Night shift Night shift Night shift Night shift Night shift Night shift")
                            .padding(5)
                            .lineLimit(nil)
                ) {
                    Toggle(isOn: $scheduled, label: {
                        Text("Scheduled")
                    })
                    
                    HStack {
                        
                        VStack {
                            Text("From")
                            Text("To")
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: Text("Scheduled Settings")) {
                                VStack {
                                    Text("Sunset")
                                        .foregroundColor(.blue)
                                    Text("Sunrise")
                                        .foregroundColor(.blue)
                                }
                        }.fixedSize()
                    }
                }
                
                Section(header: Text("").padding()) {
                    Toggle(isOn: $manuallyEnabledTillTomorrow, label: {
                        Text("Manually Enable it tomorrow")
                    })
                }
                
                Section(header: Text("COLOR TEMPERATURE").padding()) {
                    
                    
                    HStack {
                        Text("Less warm")
                        Slider(value: $colorTemperature)
                        Text("More warm")
                    }
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
