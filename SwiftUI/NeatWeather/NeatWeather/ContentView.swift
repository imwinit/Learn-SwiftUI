//
//  ContentView.swift
//  NeatWeather
//
//  Created by Vineet Kumar on 28/09/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherVm : WeatherVM
    
    init() {
        self.weatherVm = WeatherVM()
    }
    
    var body: some View {
        
        VStack(alignment: .center, spacing: nil, content: {
            
            TextField("Enter city name", text: self.$weatherVm.cityName) { _ in
                self.weatherVm.search()
            }.font(.custom("Arial", size: 50))
            .padding()
            .fixedSize()

            Text("\(self.weatherVm.temperature)")
                .font(.custom("Arial", size: 100))
                .offset(y: 100)
                .foregroundColor(.white)
                .padding()
            
        }).frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .center)
        .background(Color.green)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
