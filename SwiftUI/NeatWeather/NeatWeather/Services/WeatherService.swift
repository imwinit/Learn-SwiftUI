//
//  WeatherService.swift
//  NeatWeather
//
//  Created by Vineet Kumar on 28/09/20.
//

import Foundation

class WeatherService {
    
    func getWeather(city: String, completion: @escaping (Weather?) -> ()) {
        
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=3eefb6726c56089f9b23098ba21a53ab") else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) {data, response, error in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            if let weatherResponse = weatherResponse {
                let weather = weatherResponse.main
                completion(weather)
            }
        }.resume()
    }
}
