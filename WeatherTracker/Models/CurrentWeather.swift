//
//  CurrentWeather.swift
//  WeatherTracker
//
//  Created by Spandana Vemula on 12/17/24.
//

import Foundation

struct CurrentWeather: Codable {
    let tempC: Double
    let condition: WeatherCondition
    let humidity: Int
    let uv: Double
    let feelslikeC: Double

    private enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
        case condition
        case humidity
        case uv
        case feelslikeC = "feelslike_c"
    }
}

struct WeatherCondition: Codable {
    let icon: String
}
