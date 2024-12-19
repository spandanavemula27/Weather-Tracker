//
//  WeatherResponse.swift
//  WeatherTracker
//
//  Created by Spandana Vemula on 12/17/24.
//

import Foundation

struct WeatherResponse: Codable {
    let location: Location
    let current: CurrentWeather
}

struct Location: Codable {
    let name: String
}
