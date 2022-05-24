//
//  Weather.swift
//  NeatWeather
//
//  Created by Vineet Kumar on 28/09/20.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    
    var temp: Double?
    var humidity: Double?
}
