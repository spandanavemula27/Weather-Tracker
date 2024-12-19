//
//  WeatherService.swift
//  WeatherTracker
//
//  Created by Spandana Vemula on 12/17/24.
//

import Foundation

protocol WeatherServiceProtocol {
    func fetchWeather(for city: String) async throws -> Weather
}

class WeatherService: WeatherServiceProtocol {
    private let api: WeatherAPIProtocol

    init(api: WeatherAPIProtocol) {
        self.api = api
    }

    func fetchWeather(for city: String) async throws -> Weather {
        return try await api.getWeather(for: city)
    }
}





