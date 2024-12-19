//
//  WeatherAPI.swift
//  WeatherTracker
//
//  Created by Spandana Vemula on 12/17/24.
//

import Foundation

protocol WeatherAPIProtocol {
    func getWeather(for city: String) async throws -> Weather
}

class WeatherAPI: WeatherAPIProtocol {

    func getWeather(for city: String) async throws -> Weather {
        
        guard let url = URL(string: "\(Constants.baseURL)?key=\(Constants.apiKey)&q=\(city)") else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        let response = try JSONDecoder().decode(WeatherResponse.self, from: data)
        return Weather(
            cityName: response.location.name,
            temperature: response.current.tempC,
            iconURL: "https:\(response.current.condition.icon)",
            humidity: response.current.humidity,
            uvIndex: Int(response.current.uv),
            feelsLike: response.current.feelslikeC
        )
    }
}

